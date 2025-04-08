#!/bin/bash

main() {
    # .packageと.resolvable.versionを抽出
    package_list=$(dart pub outdated --json | jq -c '[.packages[] | select(.kind == "dev") | {package: .package, version: .resolvable.version}]')

    if [ -z "$package_list" ] || [ "$package_list" = '[]' ]; then
        echo "No outdated dev packages found."
        exit 0
    fi


    # TODO: --labelsを指定して、特定のラベルを持つissueのみを取得する
    issues=$(gh issue list  --json title,url)

    # package_listの要素を1つずつ処理
    echo "$package_list" | jq -c '.[]' | while read -r package_data; do
        package_name=$(echo "$package_data" | jq -r '.package')
        resolvable_version=$(echo "$package_data" | jq -r '.version')
      
        # Issueの命名規則: package_name / resolvable_version
        # 例: build_runner / 2.8.23

        # issuesの中から、命名規則に則った、package_nameとresolvable_versionが一致するものを探す
        matching_issue=$(echo "$issues" | jq -r --arg package_name "$package_name" --arg resolvable_version "$resolvable_version" '.[] | select(.title == ($package_name + " / " + $resolvable_version)) | .title')

        
        if [ -z "${matching_issue}" ]; then
            # issueが見つからなかった場合、またはpackage_nameが含まれていない場合

            echo "Creating new issue for $package_name..."
            # TODO: --labelsを指定して、listで検索可能にする
            new_issue_url=$(gh issue create --title "$package_name / $resolvable_version" --body "Update $package_name to version $resolvable_version")

            related_issue_url=$(echo "$issues" | jq -r --arg package_name "$package_name" '.[] | select(.title | contains($package_name)) | .url')
            if [ -n "$related_issue_url" ]; then
                # 既存のissueが見つかった場合、関連付けて閉じる

                echo "Linking new issue to related issue: $related_issue_url"
                gh issue comment "$related_issue_url" --body "Related to issue $new_issue_url"
                gh issue close "$related_issue_url"
            fi
        else
            echo "An issue for $package_name with version $resolvable_version already exists. Skipping..."
        fi
    done
}

main

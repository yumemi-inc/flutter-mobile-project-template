#!/usr/bin/env bash

# 現在のブランチを取得
current_branch=$(git branch --show-current)

# Issue番号の特定（ブランチ名から抽出）
issue=$(echo "$current_branch" | grep -oE 'GH-[0-9]+' | grep -oE '[0-9]+')

# 基準ブランチ（デフォルトはmain）
base_branch=${1:-"main"}

# 基準ブランチを最新化
git fetch origin $base_branch:$base_branch 2>/dev/null || true

# 現在のブランチと基準ブランチの共通のマージベースを確認
merge_base=$(git merge-base $base_branch $current_branch 2>/dev/null)

if [ -n "$merge_base" ]; then
  # 基準ブランチと現在のブランチに共通のマージベースが存在する場合
  latest_base=$base_branch
  latest_commit=$merge_base
else
  
  # 派生元ブランチの特定（ローカル全ブランチから自動判定）
  candidates=($(git branch --format='%(refname:short)' | grep -v "^$current_branch$"))
  latest_base=""
  latest_commit=""
  for b in "${candidates[@]}"; do
    commit=$(git merge-base $b $current_branch 2>/dev/null)
    if [ -n "$commit" ]; then
      if [ -z "$latest_commit" ] || [ "$(git log -1 --format=%ct $commit)" -gt "$(git log -1 --format=%ct $latest_commit)" ]; then
        latest_commit=$commit
        latest_base=$b
      fi
    fi
  done
  
  if [ -n "$latest_base" ]; then
    if [ "$latest_base" != "$base_branch" ] && git show-ref --verify --quiet refs/heads/$base_branch; then
      # 派生元ブランチの最新の共通コミットが 基準ブランチ に取り込まれているか確認
      if git branch --contains $latest_commit | grep -q "$base_branch"; then
        latest_base="$base_branch"
      fi
    fi
  fi
fi

# 派生元ブランチが見つからない場合
if [ -z "$latest_base" ]; then
  echo "派生元ブランチが見つかりませんでした。"
  exit 1
fi

# 変更されたファイル一覧を表示
echo -e "\n変更されたファイル一覧:"
git diff --name-status $latest_base...$current_branch

# 差分の表示
echo -e "\nブランチ $latest_base と $current_branch の差分:"
git diff $latest_base...$current_branch

# プルリクエスト作成に必要な情報をまとめて表示
echo -e "\n----------------------------------------"
echo -e "プルリクエスト作成用情報:"
echo -e "----------------------------------------"
echo -e "作業ブランチ: $current_branch"
if [ -n "$issue" ]; then
  echo -e "Issue番号: $issue"
fi
echo -e "派生元ブランチ: $latest_base"
echo -e "----------------------------------------"
echo -e "PR作成の際はこれらの情報を使用してください。" 

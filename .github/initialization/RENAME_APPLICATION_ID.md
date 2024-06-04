## 概要

`/tools/rename-application-id.sh`を実行して、FlutterプロジェクトのアプリケーションIDの名前を変更するプロセスを自動化してください。

このスクリプトは以下のステップを実行します：

1. `flavor`ディレクトリ内の構成JSONファイルのアプリケーションID定義を変更します。
2. `app`モジュール内の`build.gradle`ファイルの`namespace`の定義を新しいアプリケーションIDで更新します。
3. 更新されたパッケージ名で新しい`MainActivity.kt`ファイルを生成します。
4. 古い`MainActivity.kt`ファイルを削除します。

## 使用方法

このスクリプトを使用するには、以下の手順に従ってください：

1. スクリプトの実行に必要な権限があることを確認してください。
2. スクリプトの実行時に、新しいアプリケーションIDを引数として指定する。

```bash
bash rename-application-id.sh "com.example.rename"
```

`com.example.rename`を希望する新しいアプリケーションIDに置き換える。

## 参考

- [Configure the app module](https://developer.android.com/build/configure-app-module)
- [CFBundleIdentifier](https://developer.apple.com/documentation/bundleresources/information_property_list/cfbundleidentifier)

*ChatGPT 3.5の支援により作成。*

## 概要

`/tools/rename-application-id.sh` を実行して、Flutter プロジェクトのアプリケーション ID の名前を変更してください。

このスクリプトは以下のステップを実行します:

1. `flavor` ディレクトリ内の JSON ファイルのアプリケーション ID 定義を変更します。
2. `app` モジュール内の `build.gradle` ファイルの `namespace` の定義を新しいアプリケーション ID で更新します。
3. 古い `MainActivity.kt` ファイルを削除します。
4. 更新されたパッケージ名で新しい `MainActivity.kt` ファイルを作成します。

## 使用方法

このスクリプトを使用するには、以下の手順に従ってください:

1. スクリプトの実行に必要な権限があることを確認してください。
2. スクリプトの実行時に、新しいアプリケーションIDを引数として指定してください。
   - 第 1 引数: Android のアプリケーションID
   - 第 2 引数: iOS の Bundle ID

```sh
cd tools
chmod +x rename-application-id.sh # 必要に応じて設定してください。
./rename-application-id.sh "com.example.android.rename" "com.example.ios.rename"
```

これにより Android の Application ID が `com.example.android.rename` へ、iOS の Bundle ID が `com.example.ios.rename` へ変更されます。

## 参考

- [Configure the app module](https://developer.android.com/build/configure-app-module)
- [CFBundleIdentifier](https://developer.apple.com/documentation/bundleresources/information_property_list/cfbundleidentifier)

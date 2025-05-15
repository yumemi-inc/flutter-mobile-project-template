## はじめに

### IDE バージョン

| IDE | バージョン |
| - | - |
| Android Studio | Ladybug 2024.2.1 Patch 3 |
| Xcode | 16.2 |

**注意**: 記載されているバージョンでの動作を確認しています。これより古いバージョン、または新しいバージョンでは正常に動作しない可能性があります。

### 事前準備

- IDE をインストールしてください。
  - [IntelliJ IDEA], [Android Studio] または [Visual Studio Code]
  - [Xcode]

- [mise] コマンドを有効にしてください。

  - また、以下のコマンドを実行して`mise.toml`で指定されたバージョンを有効化してください
     (mason、melosはいずれもmise経由でのアクセスを行うと問題が起こり得るため、miseで現在のバージョンをglobalに設定するようにしている)

  ```shell
  mise i
  FLUTTER_VERSION=$(grep '^flutter =' mise.toml | awk -F'"' '{print $2}') && mise use -g flutter@$FLUTTER_VERSION
  ```

- [melos] コマンドを有効にしてください。
  - pubspec.lock ファイルを解析して melos コマンドのバージョンを取得するため、[yq] コマンドをインストールしてください。
  - 以下のコマンドを実行して melos コマンドをグローバルに有効にしてください。

    ```shell
    MELOS_VERSION=$(cat pubspec.lock | yq ".packages.melos.version" -r) && dart pub global activate melos $MELOS_VERSION
    ```

- [mason_cli] コマンドを有効にしてください。
  - 以下のコマンドを実行して mason コマンドをグローバルに有効にしてください。

    ```shell
    MASON_VERSION=$(cat pubspec.lock | yq ".packages.mason_cli.version" -r) && dart pub global activate mason_cli $MASON_VERSION
    ```

  - また、ローカルのbricksを有効にするため、以下のコマンドを実行してください。

    ```shell
    mason get
    ```

### Mise を使用するように IDE を設定

[Visual Studio Code] を使用している場合は、ウィンドウをリロードして SDK を再読み込みしてください。

[IntelliJ IDEA] または [Android Studio] を使っている場合以下の手順で設定してください

```shell
# Flutter SDK の絶対パスを表示
mise where flutter

# <USER_PATH>/.local/share/mise/installs/flutter/<FLUTTER_VERSION>
```

1. 上記のコマンドを実行しSDKの絶対パスをコピーします。
2. 「Languages & Frameworks」 > 「Flutter」に移動するか、「Flutter」を検索して、Flutter SDK のパスを変更します。
3. 変更を適用します。
4. 新しい設定が反映されるようにエディタを再起動します。

### 依存関係のインストール

```shell
melos bootstrap
```

### アプリの実行

このアプリを実行するための実行構成が設定されています。

Please check:

- [Visual Studio Code] の場合、`.vscode/launch.json` を確認してください。
- [IntelliJ IDEA] または [Android Studio] の場合、`.idea/runConfigurations/~.xml` を確認してください。

<!-- Links -->

[IntelliJ IDEA]: https://www.jetbrains.com/idea/

[Android Studio]: https://developer.android.com/studio

[Visual Studio Code]: https://code.visualstudio.com/

[Xcode]: https://developer.apple.com/xcode/

[mise]: https://mise.jdx.dev/

[melos]: https://melos.invertase.dev/

[mason_cli]: https://pub.dev/packages/mason_cli

[yq]: https://github.com/mikefarah/yq

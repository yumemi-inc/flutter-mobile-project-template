## はじめに

言語: 日本語 | [English](/docs/en/GET_STARTED.md)

### 事前準備

- IDE をインストールしてください。
  - [IntelliJ IDEA], [Android Studio] または [Visual Studio Code]
  - [Xcode]
- [fvm] コマンドを有効にしてください。
- [melos] コマンドを有効にしてください。
  - pubspec.lock ファイルを解析して melos コマンドのバージョンを取得するため、[yq] コマンドをインストールしてください。
  - 以下のコマンドを実行して melos コマンドをグローバルに有効にしてください。

    ```shell
    MELOS_VERSION=$(cat pubspec.lock | yq ".packages.melos.version" -r)
    fvm dart pub global activate melos $MELOS_VERSION
    ```

- [mason_cli] コマンドを有効にしてください。
  - また、ローカルのbricksを有効にするため、以下のコマンドを実行してください。

    ```shell
    mason get
    ```

### Flutter SDKのセットアップ

```shell
fvm use --force
```

### FVM を使用するように IDE を設定

[Visual Studio Code] を使用している場合は、ウィンドウをリロードして SDK を再読み込みしてください。

[IntelliJ IDEA] または [Android Studio] を使っている場合以下の手順で設定してください。

1. 「Languages & Frameworks」 > 「Flutter」に移動するか、「Flutter」を検索して、Flutter SDK のパスを変更します。
2. プロジェクトのルートディレクトリにある fvm シンボリックリンクの絶対パスをコピーします。
例: `/absolute-project-path/.fvm/flutter_sdk`
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

[fvm]: https://fvm.app/

[melos]: https://melos.invertase.dev/

[mason_cli]: https://pub.dev/packages/mason_cli

[yq]: https://github.com/mikefarah/yq

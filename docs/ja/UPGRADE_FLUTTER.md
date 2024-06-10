<!-- markdownlint-disable MD029 -->
### 手順

言語: 日本語 | [English](/docs/en/UPGRADE_FLUTTER.md)

1. `fvm use <upgrade version>` を実行
2. `pubspec.yaml` の `sdk, flutter` 部分のバージョンを更新
3. `melos.yaml`のbootstrapにある`sdk`, `flutter`部分のバージョンを更新

```yaml
command:
  bootstrap:
    environment:
      sdk: ^3.4.1
      flutter: ^3.22.1
```

> [!NOTE]
> `analysis_options.yaml`でyumemi_lintsのルールバージョンの更新が必要ですが、こちらは`melos bootstrap`のpost hooksで自動化的に更新されます。
`include: package:yumemi_lints/flutter/3.22/recommended.yaml`
ただしyumemi_lints自体のバージョンが古くて最新Flutterバージョンに対応していない場合があるので、その場合はyumemi_lintsを更新してください。

4. `melos bootstrap`コマンドを実行
5. iOS でアプリが起動できることを確認
6. Android でアプリが起動できることを確認
7. [Migration Guide](https://docs.flutter.dev/release/breaking-changes) に従い、必要に応じて deprecate 箇所を修正

### 注意ポイント

- iOS Simulator や Android Emulator だけでなく、実機も動作することを確認
- Flutter 側だけでなく、 Android・iOS 側で利用しているパッケージ・プラグイン・ライブラリの更新が必要ないか確認

### 手順

<!-- 英語版のドキュメントを作成してリンクさせる -->
言語: 日本語 | [English](/docs/en/UPGRADE_FLUTTER.md)

1. `fvm use <upgrade version>` を実行
2. `pubspec.yaml` の `sdk, flutter` 部分のバージョンを変更
3. `fvm flutter pub get` を実行して `pubspec.lock` を更新
4. iOS でアプリが起動できることを確認
5. Android でアプリが起動できることを確認
6. [Migration Guide](https://docs.flutter.dev/release/breaking-changes) に従い、必要に応じて deprecate 箇所を修正

### 注意ポイント

- iOS Simulator や Android Emulator だけでなく、実機も動作することを確認
- Flutter 側だけでなく、 Android・iOS 側で利用しているパッケージ・プラグイン・ライブラリの更新が必要ないか確認

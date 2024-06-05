### Procedure

<!-- 英語版のドキュメントを作成してリンクさせる -->
Language: English | [日本語](/docs/ja/UPGRADE_FLUTTER.md)

1. Run `fvm use <upgrade version>`
2. Change the version of the `sdk` and `flutter` part of `pubspec.yaml`.
3. Run `fvm flutter pub get` to update `pubspec.lock`
4. Confirm that the application can be launched on iOS
5. Confirm that the application can be launched on Android
6. Follow the [Migration Guide](https://docs.flutter.dev/release/breaking-changes) and fix deprecated parts as needed.

### Points to note

- Confirm that the actual device works as well as iOS Simulator and Android Emulator.
- Check to see if packages, plug-ins, and libraries used on the Android and iOS side as well as the Flutter side need to be updated.

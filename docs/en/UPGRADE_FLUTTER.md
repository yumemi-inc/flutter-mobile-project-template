<!-- markdownlint-disable MD029 -->
### Procedure

Language: English | [日本語](/docs/ja/UPGRADE_FLUTTER.md)

1. Run `fvm use <upgrade version>`
2. Update `sdk` version in the root-level `pubspec.yaml`
3. Update the versions of `sdk` and `flutter` in the bootstrap section of `melos.yaml`

```yaml
command:
  bootstrap:
    environment:
      sdk: ^x.x.x
      flutter: ^x.x.x
```

> [!NOTE]
> The rule version of yumemi_lints needs to be updated in `analysis_options.yaml`, which is updated automatically by the post hooks in `melos bootstrap`.
>
>```yaml
>include: package:yumemi_lints/flutter/x.x.x/recommended.yaml
>```
>
>However, the version of yumemi_lints itself may be out of date and not compatible with the latest Flutter version, so please update yumemi_lints in that case.

4. Run `melos bootstrap`
5. Confirm that the application can be launched on iOS
6. Confirm that the application can be launched on Android
7. Follow the [Migration Guide](https://docs.flutter.dev/release/breaking-changes) and fix deprecated parts as needed.

### Points to note

- Confirm that the actual device works as well as iOS Simulator and Android Emulator.
- Check to see if packages, plug-ins, and libraries used on the Android and iOS side as well as the Flutter side need to be updated.

## About Icon

### iOS

- For iOS icons, the image size used by the Apple Store is 1024x1024, and for other sizes, [flutter_launcher_icons] can automatically generate smaller ones.
- Therefore, for the icons you need, 1024x1024 is fine; smaller than 1024x1024 is fine, but too small may result in poor quality icons.

### Android

- Adaptive Launcher Icons were introduced in Android 8.0 (API level 26), allowing different shapes to be displayed for each device model.
    - `adaptive_icon_foreground`
        - Logo or icon image
        - The size of the image should be 1024x1024.
        - The size of the icon should be about 0.67 times larger than the size of the image to make it fit better.

    - `adaptive_icon_background`
        - Icon background image
        - A color code or background image is required.
        - As for the size of the image, 1024x1024 is fine.

- The following table includes specific icons. There is a border on the image, but it was added to make it visible; however, the border is not necessary when adding icons.
- For a detailed explanation, please check [adaptive icon guide].

|`adaptive_icon_foreground` | `adaptive_icon_background`| 
|:--------------------------:|:--------------------------:|
| <img src="https://github.com/yumemi-inc/flutter-mobile-project-template/assets/67954894/0d1e1559-1600-4c12-aea6-2b4b234c7f41" width="300" /> | <img src="https://github.com/yumemi-inc/flutter-mobile-project-template/assets/67954894/521be3f1-945c-4c08-9c81-6f612679801c" width="300" /> |

<!-- Links -->

[flutter_launcher_icons]: https://pub.dev/packages/flutter_launcher_icons

[adaptive icon guide]: https://developer.android.com/guide/practices/ui_guidelines/icon_design_adaptive?hl=ja

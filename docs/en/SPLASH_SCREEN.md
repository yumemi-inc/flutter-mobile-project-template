# Setting up Splash Screen

Language: English | [日本語](/docs/ja/SPLASH_SCREEN.md)

## Procedure

### 1. Adding Dependencies

Add `flutter_native_splash` to the `project_root/apps/app/pubspec.yaml`. Then, run `flutter pub get`.

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_native_splash: ^x.x.x
```

### 2. Configuring the Splash Screen

Add an image for the splash screen, such as `splash.png`. Place the image in the `project_root/apps/app/assets/splash_image` directory of your project.

```md
assets
└── splash_image
    ├── splash.png
```

Then, add the following configuration to the `project_root/apps/app/pubspec.yaml`, or create a new file named `flutter_native_splash.yaml` in the `project_root/apps/app/` directory and add the configuration there.

```yaml
flutter_native_splash:
  color: "#42A5F5" # Specify the background color of the splash screen
  image: assets/splash_image/splash.png # Path to the image used for the splash screen
  full_screen: true # Specify true if you want the splash screen to be full screen
  android: true # Enable splash screen for Android
  ios: true # Enable splash screen for iOS
  # Dark mode settings (optional)
  color_dark: "#1A73E8"
  image_dark: assets/splash_image/splash_dark.png
```

### 3. Running the Package

Once you've added the configuration, run the following command in your terminal.

```sh
flutter pub run flutter_native_splash:create
```

If the configuration is not in `pubspec.yaml` (e.g., in `flutter_native_splash.yaml`), use the `--path` option.

```sh
flutter pub run flutter_native_splash:create --path=flutter_native_splash.yaml
```

### 4. Setting Up App Initialization (Optional)

By default, the splash screen is removed when Flutter has drawn the first frame. If you want the splash screen to remain while your app initializes, use the `preserve()` and `remove()` methods together. Add the following code to your `main.dart` file.

```dart
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsFlutterBinding.ensureInitialized());

  runApp(MyApp());

  // Remove the splash screen after initialization
  initializeApp().then((_) {
    FlutterNativeSplash.remove();
  });
}

Future<void> initializeApp() async {
  // Initialization code
  await Future.delayed(Duration(seconds: 2));
}
```

>[!FYI]
>If you do not need to use the preserve() and remove() methods, you can place the `flutter_native_splash` dependency in the dev_dependencies section of `pubspec.yaml`.

---

By following these steps, you can set up a splash screen in your Flutter app. For more details, refer to the official [README](https://pub.dev/packages/flutter_native_splash).

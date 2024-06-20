# Flutter スプラッシュ画面設定ガイド

このドキュメントは、Flutterアプリでカスタムスプラッシュ画面を設定する手順を説明します。`flutter_native_splash` パッケージを使用します。

## 手順

### 1. 依存関係の追加

プロジェクトの `プロジェクトのルート/apps/app/pubspec.yaml` ファイルに `flutter_native_splash` を追加してください。その後、`flutter pub get` を実行します。

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_native_splash: ^x.x.x
```  

### 2. スプラッシュ画面の設定

  `splash.png` のようなスプラッシュ画面用の画像を追加してください。画像はプロジェクトの `プロジェクトのルート/apps/app/assets/splash_image` ディレクトリに配置します。

```md
assets
└── splash_image
    ├── splash.png
```

  その後、以下の設定を `pubspec.yaml` ファイルに追加するか、プロジェクトのルートフォルダに `flutter_native_splash.yaml` という新しいファイルを作成し、そこに設定を追加します。

```yaml

flutter_native_splash:
  color: "#42a5f5"
  image: assets/splash.png
  full_screen: true
  android: true
  ios: true
  web: true
  # ダークモード設定（オプション）
  color_dark: "#1a73e8"
  image_dark: assets/splash_dark.png
  ```

### 3. パッケージの実行

設定を追加したら、ターミナルで以下のコマンドを実行します。

```sh
flutter pub run flutter_native_splash:create
```

設定が pubspec.yaml 以外にある場合は、 --path オプションを使用してください。

```sh
flutter pub run flutter_native_splash:create --path=flutter_native_splash.yaml
```

### 4. アプリ初期化のセットアップ（オプション）

デフォルトでは、スプラッシュ画面はFlutterが最初のフレームを描画したときに削除されます。もしアプリの初期化が完了するまでスプラッシュ画面を保持したい場合は、 `preserve()` と `remove()` メソッドを使用します。
main.dart ファイルで以下のコードを追加します。

```dart
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsFlutterBinding.ensureInitialized());

  runApp(MyApp());

  // 初期化後にスプラッシュ画面を削除する
  initializeApp().then((_) {
    FlutterNativeSplash.remove();
  });
}

Future<void> initializeApp() async {
  // 初期化処理
  await Future.delayed(Duration(seconds: 2));
}
```

この手順に従って、Flutterアプリにカスタムスプラッシュ画面を設定することができます。
その他詳細な情報やサポートについては、公式の [README](https://pub.dev/packages/flutter_native_splash) を参照してください。

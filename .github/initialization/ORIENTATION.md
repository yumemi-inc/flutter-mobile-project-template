# 画面の向き (Orientation) の設定

このIssueは、Flutterアプリケーションの画面の向き（縦向き・横向き）に関する設定方法を決定し、適用するためのものです。
アプリの性質やユーザー体験に応じて、特定の向きに固定したり、複数の向きをサポートしたりすることができます。

## 背景

Flutterでは、画面の向きを制御する方法がいくつかあります。

### Dartコードによる制御

`SystemChrome.setPreferredOrientations` メソッドを使用すると、アプリケーションがサポートする画面の向きをDartコードレベルで指定できます。
これはアプリケーション全体、または特定の画面に対して適用可能です。

```dart
// main.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  // 縦向きに変更
  // SystemChrome.setPreferredOrientations([
  //  DeviceOrientation.portraitDown,
  //  DeviceOrientation.portraitUp
  // ]);

  // 横向きに変更
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.landscapeLeft,
  //   DeviceOrientation.landscapeRight
  // ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // ...
}
```

<!-- markdownlint-disable MD033 MD045-->

### iOSネイティブ設定

Xcodeプロジェクトのターゲット設定 (`Runner` > `General` > `Deployment Info`) で、アプリがサポートする向きを選択します。

<img src="https://github.com/user-attachments/assets/2d66b816-212a-4d6f-b528-c862a8518bba" width="500" />

iPadの場合、Split ViewやSlide Overといったマルチタスク機能を無効化（`Requires full screen` を `YES` に設定）しないと、Dartコードによる向きの指定が期待通りに動作しないことがあります。

### Androidネイティブ設定

`android/app/src/main/AndroidManifest.xml` ファイル内のメインとなる `<activity>` タグに `android:screenOrientation` 属性を追加することで、アクティビティごとの画面の向きを指定できます。

```xml
<!-- android/app/src/main/AndroidManifest.xml -->
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <application ...>
        <activity
            android:name=".MainActivity"
            android:launchMode="singleTop"
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize"
            <!-- 例: 縦向きに固定 -->
             android:screenOrientation="portrait"
            ...
    </application>
</manifest>
```

- 指定できる値には以下があります(一部)
  - `portrait`
  - `landscape`
  - `sensorLandscape`
  - `userPortrait`
  - `fullSensor`

<!-- markdownlint-enable MD033 MD045-->

## Todo

プロジェクトの要件に基づき、画面の向きに関する方針を決定し、以下のいずれか、または両方の方法で設定を行ってください。

### 方針決定

- アプリケーション全体で画面の向きを固定するか？（例: 常に縦向き）
- 特定の画面のみ向きを固定/変更するか？
- ユーザーのデバイス設定に追従させるか？（特に指定しない場合）
- サポートする向きは何か？ (例: 縦向きのみ、縦横両方、横向きのみ)

- [ ] **Dartコードによる設定:**
  - `main.dart` の `main()` 関数内、または適切なWidgetで `SystemChrome.setPreferredOrientations()` を呼び出し、希望の向きを設定します。

- [ ] **iOSネイティブ設定:**
  - Xcodeで `Runner` > `General` > `Deployment Info` セクションで、サポートする向きにチェックを入れます。

- [ ] **Androidネイティブ設定:**
  - `android/app/src/main/AndroidManifest.xml` の `<activity android:name=".MainActivity" ...>` タグに `android:screenOrientation` 属性を追加し、値を設定します。

## 注意点

- **ユーザー体験**: 画面の向きを固定する場合は、ユーザーが期待する動作と一致しているか慎重に検討してください。特にタブレットなど、横向きでの利用が一般的なデバイスでは注意が必要です。
- **設定の優先順位**: Dartコードによる設定とネイティブ設定が競合する場合、動作が意図しないものになる可能性があります。基本的にはどちらか一方の方法で統一するか、両者の役割を明確に区別して設定することが推奨されます。Flutterアプリでは、Dartコード (`SystemChrome`) による制御が一般的に好まれますが、ネイティブ設定が確実な場合もあります。
- **アクセシビリティ**: 一部のユーザーはデバイスを特定の向きでしか使用できない場合があります。可能な限り両方の向きをサポートすることが望ましいです。

## ドキュメント更新

- [ ] プロジェクトの `README.md` や関連ドキュメントに、採用した画面の向きに関する設定方針と、その理由を記載します。

**全てのタスクが完了したら、このIssueを閉じてください。**

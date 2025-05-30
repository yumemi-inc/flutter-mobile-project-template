# Flutter アプリの多言語化設定

## 背景

この Flutter プロジェクトでは、複数の言語をサポートするために `flutter_localizations` パッケージと `intl` パッケージを利用した多言語化（ローカライゼーション）を行います。
ローカライズされた文字列は `.arb` (Application Resource Bundle) ファイルに定義し、Dart のコードを自動生成してアプリ内で利用します。

この Issue では、プロジェクトでサポートする言語を決定し、必要な設定ファイルを追加・更新する手順を定義します。

## Flutter プロジェクト(パッケージ)における多言語化設定

### 1. `pubspec.yaml` の設定

多言語化に必要なパッケージが `pubspec.yaml` に含まれていることを確認します。

```yaml
dependencies:
  flutter:
    sdk: flutter
  # 多言語化パッケージ
  flutter_localizations:
    sdk: flutter

# ... 他の依存関係 ...

flutter:
  # ... 他の設定 ...
  generate: true # flutter gen-l10n を有効にする
```

### 2. `l10n.yaml` の設定

プロジェクトルートに `l10n.yaml` ファイルを作成し、ローカライズ設定を定義します。

```yaml
arb-dir: lib/l10n # .arb ファイルを配置するディレクトリ
template-arb-file: app_en.arb # 翻訳の元となるテンプレート ARB ファイル
output-localization-file: l10n.dart # 生成される Dart ファイル名
output-class: L10n # 生成されるクラス名
nullable-getter: false # 生成される getter を non-nullable にする
```

- `arb-dir`: `.arb` ファイルが格納されるディレクトリを指定します。通常、`lib/l10n` が使用されます。
- `template-arb-file`: 翻訳のベースとなる `.arb` ファイル名を指定します (例: `app_en.arb` は英語の文字列を定義)。
- `output-localization-file`: 生成される Dart ファイル名を指定します。
- `output-class`: 生成されるクラス名を指定します。
- `nullable-getter`: デフォルトでは `true` ですが、`false` にすることで、未翻訳の文字列がある場合にビルドエラーを発生させ、翻訳漏れを防ぎます。

### 3. `.arb` ファイルの作成

`l10n.yaml` で指定した `arb-dir` (例: `lib/l10n`) に、サポートする各言語の `.arb` ファイルを作成します。

例えば、英語 (en) と日本語 (ja) をサポートする場合:

- `lib/l10n/app_en.arb`:

```json
{
  "@@locale": "en",
  "helloWorld": "Hello World!",
  "@helloWorld": {
    "description": "A programmer's greeting."
  }
}
```

- `lib/l10n/app_ja.arb`:

```json
{
  "@@locale": "ja",
  "helloWorld": "こんにちは世界！"
}
```

`@@locale` で言語コードを指定します。
各文字列はキーと値のペアで定義し、キーの前に `@` を付けることで説明 (description) を追加できます。

### 4.多言語文言の生成

ターミナルで以下のコマンドを実行すると、`.arb` ファイルから Dart のコードが自動生成されます。

```sh
flutter gen-l10n
```

### 5. `MaterialApp` / `CupertinoApp` の設定

アプリのルートウィジェット (`MaterialApp` または `CupertinoApp`) で、ローカライゼーションデリゲートとサポートロケールを設定します。

```dart
MaterialApp(
  // ... 他の設定 ...
  localizationsDelegates: const [
    // 多言語化を適用しているパッケージを追加する
     ...CoresUiL10n.localizationsDelegates,
     ...MaintainL10n.localizationsDelegates,
     ...L10n.localizationsDelegates,
     ...SettingL10n.localizationsDelegates,
  ],
supportedLocales: const [
    ...CoresUiL10n.supportedLocales,
    ...MaintainL10n.supportedLocales,
    ...L10n.supportedLocales,
    ...SettingL10n.supportedLocales,
],
);
```

### 6. ローカライズされた文字列の使用

ウィジェット内でローカライズされた文字列を使用するには、`L10n.of(context)` を使います。

```dart
import 'package:your_app_name/l10n/l10n.dart';

// `l10n.yaml` で `nullable-getter: false` を設定している場合は `!` は不要です。
Text(L10n.of(context)!.helloWorld)
```

<!-- markdownlint-disable MD033 MD045-->

## プラットフォーム固有の設定

### iOS

#### `InfoPlist.strings` を使用した `Info.plist` 値のローカライズ (例: 権限文言)

<img src="https://github.com/user-attachments/assets/b7b89799-1adf-43fe-b9b5-b8e3e3928fd3" width="500" />

> [!IMPORTANT]
> InfoPlist.strings 指定しない場合、App Storeでの**言語**に対応言語が反映されません。

Flutter の `intl` パッケージによる多言語化は、主に Flutter UI 内のテキストを対象とします。しかし、iOS の `Info.plist` に定義される値 (例: アプリの表示名 `CFBundleDisplayName`、権限リクエスト時の説明文 `NSCameraUsageDescription` など) をローカライズするには、`InfoPlist.strings` ファイルを使用します。

参考: [Flutterのinfo.plistを多言語対応する方法]

<!-- markdownlint-enable MD033 MD045-->

**設定手順の概要:**

1. **`InfoPlist.strings`ファイル作成:** `ios/Runner/` ディレクトリに `Localization` ディレクトリを作成します
2. **ローカライズ言語追加:**必要な言語コード分の `ios/Runner/Localization/<言語コード>.lproj/InfoPlist.strings`を追加します。
3. **翻訳文字列の追加:**各言語の `InfoPlist.strings` ファイル内に、ローカライズしたい `Info.plist` のキーと、その翻訳された文字列を以下の形式で追加します。

例: `en.lproj/InfoPlist.strings` (英語のアプリ名)

```swift
/* Localized versions of Info.plist keys */
"CFBundleDisplayName" = "My Flutter App";
"NSCameraUsageDescription" = "This app needs access to the camera to take photos.";
```

例: `ja.lproj/InfoPlist.strings` (日本語のアプリ名)

```swift
/* Localized versions of Info.plist keys */
"CFBundleDisplayName" = "マイ Flutter アプリ";
"NSCameraUsageDescription" = "このアプリは写真を撮るためにカメラへのアクセスが必要です。";
```

**注意:**

- 各行の末尾にはセミコロン `;` が必要です。
- `Info.plist` ファイル本体の `CFBundleDisplayName` などの値は、ベース言語のものがそのまま残っていても、`InfoPlist.strings` の定義が優先されます。

**確認:**

- `flutter clean` を実行してからアプリをビルドし、シミュレータや実機の言語設定を変更して、アプリ名などがローカライズされているか確認します。

## Todo

- [ ] **コア多言語化設定:**
  - サポートする言語を決定する。
  - `pubspec.yaml` と `l10n.yaml` を設定し、各言語に対応する `.arb` ファイルを作成・記述する。

- [ ] **iOS プラットフォーム固有設定:**
  - `ios/Runner/Info.plist` の `Localizations` 配列にサポート言語を追加する。
  - アプリ名など `Info.plist` 値をローカライズするために、各言語対応の `InfoPlist.strings` を設定する。
- [ ] **動作確認:**
  - UI および `Info.plist` のローカライズが、異なるデバイス言語設定で正しく表示されることを確認する。

**全てのタスクが完了したら、このIssueを閉じてください。**

<!-- Links -->

[Flutterのinfo.plistを多言語対応する方法]: https://zenn.dev/flutternyumon/articles/ac1f80d9b6aaa0

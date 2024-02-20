// ignore_for_file: type=lint

import 'l10n.dart';

/// The translations for Japanese (`ja`).
class L10nSettingJa extends L10nSetting {
  L10nSettingJa([String locale = 'ja']) : super(locale);

  @override
  String get settingAppBar => '設定';

  @override
  String get settingThemeSetting => 'テーマ設定';
}

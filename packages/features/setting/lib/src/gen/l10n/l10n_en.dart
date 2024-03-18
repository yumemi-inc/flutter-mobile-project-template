// ignore_for_file: type=lint

import 'l10n.dart';

/// The translations for English (`en`).
class L10nSettingEn extends L10nSetting {
  L10nSettingEn([String locale = 'en']) : super(locale);

  @override
  String get settingAppBar => 'Setting';

  @override
  String get settingThemeSetting => 'Theme Setting';

  @override
  String get settingAbout => 'About FlutterMobileTemplate';

  @override
  String get settingOpenSourceLicenses => 'Open source licenses';

  @override
  String get settingLibrariesWeUse => 'Libraries we use';

  @override
  String get settingVersion => 'Version';
}

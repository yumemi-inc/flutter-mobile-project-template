import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

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

// ignore_for_file: type=lint

import 'l10n.dart';

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get appBar => 'Flutter Template';

  @override
  String get bottomTabHome => 'Home';

  @override
  String get bottomTabSettings => 'Settings';
}

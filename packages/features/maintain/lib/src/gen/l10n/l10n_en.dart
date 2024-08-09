// ignore_for_file: type=lint

import 'l10n.dart';

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get maintainText => 'Maintain Text';

  @override
  String get maintainListAppBarTitle => 'Maintain List';

  @override
  String get maintainListText => 'Maintain List Text';

  @override
  String get maintainDetailAppBarTitle => 'Maintain Detail';

  @override
  String get maintainDetailText => 'Maintain Detail Text';
}

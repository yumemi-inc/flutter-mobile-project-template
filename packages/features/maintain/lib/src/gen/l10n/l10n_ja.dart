// ignore_for_file: type=lint

import 'l10n.dart';

/// The translations for Japanese (`ja`).
class L10nJa extends L10n {
  L10nJa([String locale = 'ja']) : super(locale);

  @override
  String get maintainText => 'Maintain テキスト';

  @override
  String get maintainListAppBarTitle => 'Maintain 一覧';

  @override
  String get maintainListText => 'Maintain 一覧 テキスト';

  @override
  String get maintainDetailAppBarTitle => 'Maintain 詳細';

  @override
  String get maintainDetailText => 'Maintain 詳細 テキスト';
}

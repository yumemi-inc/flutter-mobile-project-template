// ignore_for_file: type=lint

import 'l10n.dart';

/// The translations for Japanese (`ja`).
class L10nJa extends L10n {
  L10nJa([String locale = 'ja']) : super(locale);

  @override
  String get appBar => 'Flutter テンプレート';

  @override
  String get bottomTabHome => 'ホーム';

  @override
  String get bottomTabSettings => '設定';
}

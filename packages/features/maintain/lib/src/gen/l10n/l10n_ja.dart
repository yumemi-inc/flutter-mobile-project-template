// ignore_for_file: type=lint

import 'l10n.dart';

/// The translations for Japanese (`ja`).
class L10nJa extends L10n {
  L10nJa([String locale = 'ja']) : super(locale);

  @override
  String get maintainAppBar => 'メンテナンスモード';

  @override
  String get maintainDescription => 'メンテナンス中です.\n\n\n';

  @override
  String get maintainDisableButtonTitle => 'メンテナンスモードを無効にする';
}

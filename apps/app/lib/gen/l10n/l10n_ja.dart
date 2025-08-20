// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class L10nJa extends L10n {
  L10nJa([String locale = 'ja']) : super(locale);

  @override
  String get appBar => 'Flutter テンプレート';

  @override
  String get bottomTabHome => 'ホーム';

  @override
  String get bottomTabSettings => '設定';

  @override
  String get home => 'ホーム';

  @override
  String get maintainAppBar => 'メンテナンスモード';

  @override
  String get maintainDescription => 'メンテナンス中です.';

  @override
  String get maintainDisableButtonTitle => 'メンテナンスモードを無効にする';
}

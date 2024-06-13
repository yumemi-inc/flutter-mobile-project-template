// ignore_for_file: type=lint

import 'l10n.dart';

/// The translations for Japanese (`ja`).
class L10nDebugJa extends L10nDebug {
  L10nDebugJa([String locale = 'ja']) : super(locale);

  @override
  String get debugAppBar => 'デバッグモード';

  @override
  String get showErrorSnackBar => 'エラーSnackBarを表示';

  @override
  String get enableMaintenanceMode => 'メンテナンスモードを有効化';

  @override
  String get enableForceUpdate => '強制アップデートを有効化';

  @override
  String get navigation => 'NavigationPageへ遷移';

  @override
  String get navigationPageAppBar => '画面遷移画面';

  @override
  String get pageA => 'Page A';

  @override
  String get pageB => 'Page B';
}

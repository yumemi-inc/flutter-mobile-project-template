// ignore_for_file: type=lint

import 'l10n.dart';

/// The translations for English (`en`).
class L10nDebugEn extends L10nDebug {
  L10nDebugEn([String locale = 'en']) : super(locale);

  @override
  String get debugAppBar => 'Debug Mode';

  @override
  String get showErrorSnackBar => 'Show error SnackBar';

  @override
  String get enableMaintenanceMode => 'Enable maintenance mode';

  @override
  String get enableForceUpdate => 'Enable force update';

  @override
  String get navigation => 'Go to NavigationPage';

  @override
  String get navigationPageAppBar => 'Navigation Page';

  @override
  String get pageA => 'Page A';

  @override
  String get pageB => 'Page B';
}

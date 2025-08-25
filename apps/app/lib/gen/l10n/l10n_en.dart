// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get appBar => 'Flutter Template';

  @override
  String get bottomTabHome => 'Home';

  @override
  String get bottomTabSettings => 'Settings';

  @override
  String get home => 'Home';

  @override
  String get maintainAppBar => 'Maintenance mode';

  @override
  String get maintainDescription => 'Maintenance in progress.';

  @override
  String get maintainDisableButtonTitle => 'Disable maintenance mode';
}

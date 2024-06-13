// ignore_for_file: type=lint
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';
import 'l10n_ja.dart';

/// Callers can lookup localized strings with an instance of L10nDebug
/// returned by `L10nDebug.of(context)`.
///
/// Applications need to include `L10nDebug.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10nDebug.localizationsDelegates,
///   supportedLocales: L10nDebug.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L10nDebug.supportedLocales
/// property.
abstract class L10nDebug {
  L10nDebug(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10nDebug of(BuildContext context) {
    return Localizations.of<L10nDebug>(context, L10nDebug)!;
  }

  static const LocalizationsDelegate<L10nDebug> delegate = _L10nDebugDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ja'),
    Locale('en')
  ];

  /// No description provided for @debugAppBar.
  ///
  /// In ja, this message translates to:
  /// **'デバッグモード'**
  String get debugAppBar;

  /// No description provided for @showErrorSnackBar.
  ///
  /// In ja, this message translates to:
  /// **'エラーSnackBarを表示'**
  String get showErrorSnackBar;

  /// No description provided for @enableMaintenanceMode.
  ///
  /// In ja, this message translates to:
  /// **'メンテナンスモードを有効化'**
  String get enableMaintenanceMode;

  /// No description provided for @enableForceUpdate.
  ///
  /// In ja, this message translates to:
  /// **'強制アップデートを有効化'**
  String get enableForceUpdate;

  /// No description provided for @navigation.
  ///
  /// In ja, this message translates to:
  /// **'NavigationPageへ遷移'**
  String get navigation;

  /// No description provided for @navigationPageAppBar.
  ///
  /// In ja, this message translates to:
  /// **'画面遷移画面'**
  String get navigationPageAppBar;

  /// No description provided for @pageA.
  ///
  /// In ja, this message translates to:
  /// **'Page A'**
  String get pageA;

  /// No description provided for @pageB.
  ///
  /// In ja, this message translates to:
  /// **'Page B'**
  String get pageB;
}

class _L10nDebugDelegate extends LocalizationsDelegate<L10nDebug> {
  const _L10nDebugDelegate();

  @override
  Future<L10nDebug> load(Locale locale) {
    return SynchronousFuture<L10nDebug>(lookupL10nDebug(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDebugDelegate old) => false;
}

L10nDebug lookupL10nDebug(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return L10nDebugEn();
    case 'ja':
      return L10nDebugJa();
  }

  throw FlutterError(
      'L10nDebug.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}

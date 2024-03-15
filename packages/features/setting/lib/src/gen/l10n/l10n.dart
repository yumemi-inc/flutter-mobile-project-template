// ignore_for_file: type=lint
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';
import 'l10n_ja.dart';

/// Callers can lookup localized strings with an instance of L10nSetting
/// returned by `L10nSetting.of(context)`.
///
/// Applications need to include `L10nSetting.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10nSetting.localizationsDelegates,
///   supportedLocales: L10nSetting.supportedLocales,
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
/// be consistent with the languages listed in the L10nSetting.supportedLocales
/// property.
abstract class L10nSetting {
  L10nSetting(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10nSetting of(BuildContext context) {
    return Localizations.of<L10nSetting>(context, L10nSetting)!;
  }

  static const LocalizationsDelegate<L10nSetting> delegate = _L10nSettingDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
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

  /// No description provided for @settingAppBar.
  ///
  /// In ja, this message translates to:
  /// **'設定'**
  String get settingAppBar;

  /// No description provided for @settingThemeSetting.
  ///
  /// In ja, this message translates to:
  /// **'テーマ設定'**
  String get settingThemeSetting;

  /// No description provided for @settingAbout.
  ///
  /// In ja, this message translates to:
  /// **'FlutterMobileTemplate について'**
  String get settingAbout;

  /// No description provided for @settingOpenSourceLicenses.
  ///
  /// In ja, this message translates to:
  /// **'オープンソースライセンス'**
  String get settingOpenSourceLicenses;

  /// No description provided for @settingLibrariesWeUse.
  ///
  /// In ja, this message translates to:
  /// **'使用しているライブラリ'**
  String get settingLibrariesWeUse;

  /// No description provided for @settingVersion.
  ///
  /// In ja, this message translates to:
  /// **'バージョン'**
  String get settingVersion;
}

class _L10nSettingDelegate extends LocalizationsDelegate<L10nSetting> {
  const _L10nSettingDelegate();

  @override
  Future<L10nSetting> load(Locale locale) {
    return SynchronousFuture<L10nSetting>(lookupL10nSetting(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nSettingDelegate old) => false;
}

L10nSetting lookupL10nSetting(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return L10nSettingEn();
    case 'ja': return L10nSettingJa();
  }

  throw FlutterError(
    'L10nSetting.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

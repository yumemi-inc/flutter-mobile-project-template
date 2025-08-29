///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsEn implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsEn _root = this; // ignore: unused_field

	@override 
	TranslationsEn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEn(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsBottomTabEn bottomTab = _TranslationsBottomTabEn._(_root);
	@override late final _TranslationsHomeEn home = _TranslationsHomeEn._(_root);
	@override late final _TranslationsMaintenanceEn maintenance = _TranslationsMaintenanceEn._(_root);
	@override late final _TranslationsSettingEn setting = _TranslationsSettingEn._(_root);
}

// Path: bottomTab
class _TranslationsBottomTabEn implements TranslationsBottomTabJa {
	_TranslationsBottomTabEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get home => 'Home';
	@override String get settings => 'Settings';
}

// Path: home
class _TranslationsHomeEn implements TranslationsHomeJa {
	_TranslationsHomeEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Home';
	@override String get appBarTitle => 'Flutter Template';
}

// Path: maintenance
class _TranslationsMaintenanceEn implements TranslationsMaintenanceJa {
	_TranslationsMaintenanceEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get appBarTitle => 'Maintenance mode';
	@override String get description => 'Maintenance in progress.';
	@override String get disableButtonLabel => 'Disable maintenance mode';
}

// Path: setting
class _TranslationsSettingEn implements TranslationsSettingJa {
	_TranslationsSettingEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get appBarTitle => 'Setting';
	@override String get themeSettingLabel => 'Theme Setting';
	@override String get aboutLabel => 'About FlutterMobileTemplate';
	@override String get openSourceLicensesLabel => 'Open source licenses';
	@override String get librariesWeUseLabel => 'Libraries we use';
	@override String get versionLabel => 'Version';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'bottomTab.home': return 'Home';
			case 'bottomTab.settings': return 'Settings';
			case 'home.title': return 'Home';
			case 'home.appBarTitle': return 'Flutter Template';
			case 'maintenance.appBarTitle': return 'Maintenance mode';
			case 'maintenance.description': return 'Maintenance in progress.';
			case 'maintenance.disableButtonLabel': return 'Disable maintenance mode';
			case 'setting.appBarTitle': return 'Setting';
			case 'setting.themeSettingLabel': return 'Theme Setting';
			case 'setting.aboutLabel': return 'About FlutterMobileTemplate';
			case 'setting.openSourceLicensesLabel': return 'Open source licenses';
			case 'setting.librariesWeUseLabel': return 'Libraries we use';
			case 'setting.versionLabel': return 'Version';
			default: return null;
		}
	}
}


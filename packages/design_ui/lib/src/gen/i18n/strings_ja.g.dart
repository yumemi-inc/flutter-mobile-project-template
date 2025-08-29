///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsJa = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsBottomTabJa bottomTab = TranslationsBottomTabJa._(_root);
	late final TranslationsHomeJa home = TranslationsHomeJa._(_root);
	late final TranslationsMaintenanceJa maintenance = TranslationsMaintenanceJa._(_root);
	late final TranslationsSettingJa setting = TranslationsSettingJa._(_root);
}

// Path: bottomTab
class TranslationsBottomTabJa {
	TranslationsBottomTabJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ホーム'
	String get home => 'ホーム';

	/// ja: '設定'
	String get settings => '設定';
}

// Path: home
class TranslationsHomeJa {
	TranslationsHomeJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ホーム'
	String get title => 'ホーム';

	/// ja: 'Flutter テンプレート'
	String get appBarTitle => 'Flutter テンプレート';
}

// Path: maintenance
class TranslationsMaintenanceJa {
	TranslationsMaintenanceJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'メンテナンスモード'
	String get appBarTitle => 'メンテナンスモード';

	/// ja: 'メンテナンス中です.'
	String get description => 'メンテナンス中です.';

	/// ja: 'メンテナンスモードを無効にする'
	String get disableButtonLabel => 'メンテナンスモードを無効にする';
}

// Path: setting
class TranslationsSettingJa {
	TranslationsSettingJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '設定'
	String get appBarTitle => '設定';

	/// ja: 'テーマ設定'
	String get themeSettingLabel => 'テーマ設定';

	/// ja: 'FlutterMobileTemplate について'
	String get aboutLabel => 'FlutterMobileTemplate について';

	/// ja: 'オープンソースライセンス'
	String get openSourceLicensesLabel => 'オープンソースライセンス';

	/// ja: '使用しているライブラリ'
	String get librariesWeUseLabel => '使用しているライブラリ';

	/// ja: 'バージョン'
	String get versionLabel => 'バージョン';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'bottomTab.home': return 'ホーム';
			case 'bottomTab.settings': return '設定';
			case 'home.title': return 'ホーム';
			case 'home.appBarTitle': return 'Flutter テンプレート';
			case 'maintenance.appBarTitle': return 'メンテナンスモード';
			case 'maintenance.description': return 'メンテナンス中です.';
			case 'maintenance.disableButtonLabel': return 'メンテナンスモードを無効にする';
			case 'setting.appBarTitle': return '設定';
			case 'setting.themeSettingLabel': return 'テーマ設定';
			case 'setting.aboutLabel': return 'FlutterMobileTemplate について';
			case 'setting.openSourceLicensesLabel': return 'オープンソースライセンス';
			case 'setting.librariesWeUseLabel': return '使用しているライブラリ';
			case 'setting.versionLabel': return 'バージョン';
			default: return null;
		}
	}
}


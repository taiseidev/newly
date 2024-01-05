/// Generated file. Do not edit.
///
/// Original: lib/core/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 1
/// Strings: 14
///
/// Built on 2024-01-05 at 11:43 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.ja;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.ja) // set locale
/// - Locale locale = AppLocale.ja.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.ja) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _StringsJa> {
	ja(languageCode: 'ja', build: _StringsJa.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, _StringsJa> build;

	/// Gets current instance managed by [LocaleSettings].
	_StringsJa get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of i18n).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = i18n.someKey.anotherKey;
/// String b = i18n['someKey.anotherKey']; // Only for edge cases!
_StringsJa get i18n => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final i18n = Translations.of(context); // Get i18n variable.
/// String a = i18n.someKey.anotherKey; // Use i18n variable.
/// String b = i18n['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsJa of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsJa>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _StringsJa> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, _StringsJa> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsJa>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.i18n.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_StringsJa get i18n => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _StringsJa> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _StringsJa> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _StringsJa implements BaseTranslations<AppLocale, _StringsJa> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsJa.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, _StringsJa> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final _StringsJa _root = this; // ignore: unused_field

	// Translations
	String get appTitle => 'Newly';
	late final _StringsAppThemeJa appTheme = _StringsAppThemeJa._(_root);
	late final _StringsDrawerJa drawer = _StringsDrawerJa._(_root);
}

// Path: appTheme
class _StringsAppThemeJa {
	_StringsAppThemeJa._(this._root);

	final _StringsJa _root; // ignore: unused_field

	// Translations
	String get eclipse => '日食';
	String get harmony => '調和';
	String get oasis => 'オアシス';
	String get serenity => '静寂';
	String get sunset => '日没';
	String get zen => '禅';
}

// Path: drawer
class _StringsDrawerJa {
	_StringsDrawerJa._(this._root);

	final _StringsJa _root; // ignore: unused_field

	// Translations
	String get theme => 'テーマ設定';
	String get contact => 'お問い合わせ';
	String get termOfService => '利用規約';
	String get privacyPolicy => 'プライバシーポリシー';
	String get feedback => 'フィードバック';
	String get logout => 'ログアウト';
	String version({required Object version}) => 'ver. ${version}';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsJa {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appTitle': return 'Newly';
			case 'appTheme.eclipse': return '日食';
			case 'appTheme.harmony': return '調和';
			case 'appTheme.oasis': return 'オアシス';
			case 'appTheme.serenity': return '静寂';
			case 'appTheme.sunset': return '日没';
			case 'appTheme.zen': return '禅';
			case 'drawer.theme': return 'テーマ設定';
			case 'drawer.contact': return 'お問い合わせ';
			case 'drawer.termOfService': return '利用規約';
			case 'drawer.privacyPolicy': return 'プライバシーポリシー';
			case 'drawer.feedback': return 'フィードバック';
			case 'drawer.logout': return 'ログアウト';
			case 'drawer.version': return ({required Object version}) => 'ver. ${version}';
			default: return null;
		}
	}
}

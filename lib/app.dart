import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nost/core/i18n/strings.g.dart';
import 'package:nost/core/navigation/router/router.dart';
import 'package:nost/core/res/theme.dart';
import 'package:nost/core/theme/app_theme.dart';
import 'package:nost/core/theme/theme_mode.dart';
import 'package:nost/core/utils/loading.dart';

final scaffoldMessengerKeyProvider = Provider(
  (_) => GlobalKey<ScaffoldMessengerState>(),
);

final class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final isLoading = ref.watch(loadingNotifierProvider);
    final themeMode = ref.watch(themeModeNotifierProvider);
    final appTheme = ref.watch(appThemeNotifierProvider);

    return MaterialApp.router(
      title: i18n.appTitle,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      themeMode: themeMode,
      scaffoldMessengerKey: ref.watch(scaffoldMessengerKeyProvider),
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      theme: getLightTheme(
        context,
        appTheme.light,
      ),
      darkTheme: getDarkTheme(
        context,
        appTheme.dark,
      ),
      builder: (context, child) => Stack(
        children: [
          child!,
          if (isLoading)
            const ColoredBox(
              color: Colors.black26,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}

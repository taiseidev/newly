import 'package:flutter/material.dart';
import 'package:nost/core/res/color/eclipse.g.dart';
import 'package:nost/core/res/color/harmony.g.dart';
import 'package:nost/core/res/color/oasis.g.dart';
import 'package:nost/core/res/color/serenity.g.dart';
import 'package:nost/core/res/color/sunset.g.dart';
import 'package:nost/core/res/color/zen.g.dart';
import 'package:nost/core/shared_preference/preference_key_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_theme.g.dart';

@riverpod
class AppThemeNotifier extends _$AppThemeNotifier {
  @override
  ({ColorScheme light, ColorScheme dark}) build() {
    final lastAppThemeString = PreferenceKeyType.appTheme.getString();
    final lastAppTheme = _stringToAppTheme(lastAppThemeString);
    return getColorScheme(lastAppTheme);
  }

  Future<void> update(String appTheme) async {
    await PreferenceKeyType.appTheme.setString(appTheme);
    final theme = _stringToAppTheme(appTheme);
    state = getColorScheme(theme);
  }

  ({ColorScheme light, ColorScheme dark}) getColorScheme(ThemeType? type) =>
      switch (type) {
        ThemeType.harmony => (
            light: lightHarmonyColorScheme,
            dark: darkHarmonyColorScheme,
          ),
        ThemeType.oasis => (
            light: lightOasisColorScheme,
            dark: darkOasisColorScheme,
          ),
        ThemeType.serenity => (
            light: lightSerenityColorScheme,
            dark: darkSerenityColorScheme,
          ),
        ThemeType.sunset => (
            light: lightSunsetColorScheme,
            dark: darkSunsetColorScheme,
          ),
        ThemeType.zen => (
            light: lightZenColorScheme,
            dark: darkZenColorScheme,
          ),
        ThemeType.eclipse || _ => (
            light: lightEclipseColorScheme,
            dark: darkEclipseColorScheme,
          ),
      };

  ThemeType? _stringToAppTheme(String? themeString) {
    return ThemeType.values.firstWhere(
      (e) => e.name == themeString,
      orElse: () => ThemeType.eclipse,
    );
  }
}

enum ThemeType {
  eclipse,
  harmony,
  oasis,
  serenity,
  sunset,
  zen;
}

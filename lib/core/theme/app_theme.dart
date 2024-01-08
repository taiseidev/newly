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
  (ColorScheme, ColorScheme) build() {
    final lastAppThemeString = PreferenceKeyType.appTheme.getString();
    final lastAppTheme = _stringToAppTheme(lastAppThemeString);

    return switch (lastAppTheme) {
      ThemeType.harmony => (lightHarmonyColorScheme, darkHarmonyColorScheme),
      ThemeType.oasis => (lightOasisColorScheme, darkOasisColorScheme),
      ThemeType.serenity => (lightSerenityColorScheme, darkSerenityColorScheme),
      ThemeType.sunset => (lightSunsetColorScheme, darkSunsetColorScheme),
      ThemeType.zen => (lightZenColorScheme, darkZenColorScheme),
      ThemeType.eclipse || _ => (
          lightEclipseColorScheme,
          darkEclipseColorScheme
        ),
    };
  }

  Future<void> update(String appTheme) async {
    await PreferenceKeyType.appTheme.setString(appTheme);
    final theme = _stringToAppTheme(appTheme);
    state = switch (theme) {
      ThemeType.harmony => (lightHarmonyColorScheme, darkHarmonyColorScheme),
      ThemeType.oasis => (lightOasisColorScheme, darkOasisColorScheme),
      ThemeType.serenity => (lightSerenityColorScheme, darkSerenityColorScheme),
      ThemeType.sunset => (lightSunsetColorScheme, darkSunsetColorScheme),
      ThemeType.zen => (lightZenColorScheme, darkZenColorScheme),
      ThemeType.eclipse || _ => (
          lightEclipseColorScheme,
          darkEclipseColorScheme
        ),
    };
  }

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

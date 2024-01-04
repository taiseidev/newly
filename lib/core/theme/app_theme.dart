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
    final lastAppTheme = PreferenceKeyType.appTheme.getString();

    // TODO(taisei): 文字列部分をenumに変更
    return switch (lastAppTheme) {
      'eclipse' => (lightEclipseColorScheme, darkEclipseColorScheme),
      'harmony' => (lightHarmonyColorScheme, darkHarmonyColorScheme),
      'oasis' => (lightOasisColorScheme, darkOasisColorScheme),
      'serenity' => (lightSerenityColorScheme, darkSerenityColorScheme),
      'sunset' => (lightSunsetColorScheme, darkSunsetColorScheme),
      'zen' => (lightZenColorScheme, darkZenColorScheme),
      _ => (lightEclipseColorScheme, darkEclipseColorScheme),
    };
  }

  Future<void> update(String appTheme) async {
    await PreferenceKeyType.appTheme.setString(appTheme);
    state = switch (appTheme) {
      'eclipse' => (lightEclipseColorScheme, darkEclipseColorScheme),
      'harmony' => (lightHarmonyColorScheme, darkHarmonyColorScheme),
      'oasis' => (lightOasisColorScheme, darkOasisColorScheme),
      'serenity' => (lightSerenityColorScheme, darkSerenityColorScheme),
      'sunset' => (lightSunsetColorScheme, darkSunsetColorScheme),
      'zen' => (lightZenColorScheme, darkZenColorScheme),
      _ => (lightEclipseColorScheme, darkEclipseColorScheme),
    };
  }
}

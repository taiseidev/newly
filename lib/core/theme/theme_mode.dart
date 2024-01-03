import 'package:flutter/material.dart';
import 'package:nost/core/shared_preference/preference_key_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode.g.dart';

@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  ThemeMode build() {
    final lastThemeMode = PreferenceKeyType.themeMode.getString();

    return ThemeMode.values.firstWhere(
      (element) => element.name == lastThemeMode,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> update(ThemeMode themeMode) async {
    await PreferenceKeyType.themeMode.setString(themeMode.name);
    state = themeMode;
  }
}

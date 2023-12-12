import 'package:flutter/material.dart';

ThemeData getLightTheme() {
  final base = ThemeData(
    useMaterial3: false,
  );
  return base.copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    ),
  );
}

ThemeData getDarkTheme() {
  final base = ThemeData(
    useMaterial3: true,
  );
  return base.copyWith();
}

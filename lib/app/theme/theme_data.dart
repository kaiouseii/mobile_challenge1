import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData(
    colorScheme: ColorScheme.dark(
      primary: Colors.red.shade900,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.red.shade900,
      foregroundColor: Colors.white,
    ),
  );
}

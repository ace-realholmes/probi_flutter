import 'package:flutter/material.dart';

class DarkTheme {
  final ThemeData darkTheme = ThemeData(
      colorScheme: darkColorScheme,
      canvasColor: darkColorScheme.background,
      scaffoldBackgroundColor: darkColorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: darkColorScheme.primary,
      inputDecorationTheme:
          const InputDecorationTheme(fillColor: Color.fromARGB(179, 66, 66, 66)));

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFFF8383),
    secondary: Color(0xFF4D1F7C),
    background: Color(0xFF241E30),
    surface: Color(0xFF1F1929),
    onBackground: Color(0x0DFFFFFF),
    error: Colors.redAccent,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    brightness: Brightness.dark,
  );
}

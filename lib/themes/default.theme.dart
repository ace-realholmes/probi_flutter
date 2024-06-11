import 'package:flutter/material.dart';

class LightTheme {

  final ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    canvasColor: lightColorScheme.background,
    scaffoldBackgroundColor: lightColorScheme.background,
    highlightColor: Colors.transparent,
    focusColor: lightColorScheme.primary,
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Colors.white70
    )
  );

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFFB93C5D),
    onPrimary: Colors.black,
    secondary: Color(0xFFEFF3F3),
    onSecondary: Color(0xFF322942),
    error: Colors.redAccent,
    onError: Colors.white,
    background: Color(0xFFE6EBEB),
    onBackground: Colors.white,
    surface: Color(0xFFFAFBFB),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );
}

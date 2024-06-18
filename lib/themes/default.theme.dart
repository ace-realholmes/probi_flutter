import 'package:flutter/material.dart';

final ThemeData lightThemeData = ThemeData(
    colorScheme: lightColorScheme,
    canvasColor: const Color(0xFFE6EBEB),
    scaffoldBackgroundColor: const Color(0xFFE6EBEB),
    highlightColor: Colors.transparent,
    focusColor: lightColorScheme.primary,
    inputDecorationTheme:
        const InputDecorationTheme(fillColor: Colors.white70));

const ColorScheme lightColorScheme = ColorScheme(
  primary: Color(0xFFB93C5D),
  onPrimary: Colors.black,
  secondary: Color(0xFFEFF3F3),
  onSecondary: Color(0xFF322942),
  error: Colors.redAccent,
  onError: Colors.white,
  surface: Color(0xFFFAFBFB),
  onSurface: Color(0xFF241E30),
  brightness: Brightness.light,
);

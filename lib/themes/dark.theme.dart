import 'package:flutter/material.dart';

ThemeData darkThemeData = ThemeData(
    colorScheme: darkColorScheme,
    canvasColor: const Color(0xFF241E30),
    scaffoldBackgroundColor: const Color(0xFF241E30),
    highlightColor: Colors.transparent,
    focusColor: darkColorScheme.primary,
    inputDecorationTheme:
        const InputDecorationTheme(fillColor: Color.fromARGB(179, 66, 66, 66)));

const ColorScheme darkColorScheme = ColorScheme(
  primary: Color(0xFFFF8383),
  secondary: Color(0xFF4D1F7C),
  surface: Color(0xFF1F1929),
  error: Colors.redAccent,
  onError: Colors.white,
  onPrimary: Colors.white,
  onSecondary: Colors.white,
  onSurface: Colors.white,
  brightness: Brightness.dark,
);

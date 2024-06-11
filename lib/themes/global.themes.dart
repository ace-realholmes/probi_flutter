import 'package:flutter/material.dart';

class GlobalThemData {
  static final Color _lightFillColor = Colors.white70;
  static final Color _darkFillColor = Color(0xFF242424); 

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFillColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFillColor);

  static ThemeData themeData(ColorScheme colorScheme, Color fillColor) {
    return ThemeData(
      colorScheme: colorScheme,
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: colorScheme.primary, 
      inputDecorationTheme: InputDecorationTheme(
        fillColor: fillColor, 
      ),
    );
  }

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

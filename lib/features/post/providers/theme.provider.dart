import 'package:flutter/material.dart';

/// Provider for managing theme of the application.
///
/// This class handles updating of theme into light or dark mode
/// It notifies listeners when there are updates.
class ThemeProvider extends ChangeNotifier {
  /// Setting the themeMode to light initially.
  ThemeMode _themeMode = ThemeMode.light;

  /// Return the value of _themeMode to themeMode
  ThemeMode get themeMode => _themeMode;

  /// Function to handle the toggle of theme from light to dark and vice versa.
  void toggleTheme() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}

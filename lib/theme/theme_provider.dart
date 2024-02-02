import 'package:flutter/material.dart';
import 'package:minimal_notes_app/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  // initially, theme is light mode
  ThemeData _themeData = lightMode;

  // getter methods to access the theme from other parts of the code
  ThemeData get themeData => _themeData;

  // getter methods o check if we in dark mode
  bool get isDarkMode => _themeData  == darkMode;

  // setter Theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
  }

  // methods to toggle theme
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    }
    else {
      themeData = lightMode;
    }
  }
}
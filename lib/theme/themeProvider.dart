import 'package:flutter/material.dart';
import 'package:weather_app/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {
  final _themedata = darkMode;
  ThemeData get themeData => _themedata;
  bool get isDarkMode => _themedata == darkMode;
  set themeData(ThemeData theme) {
    themeData = theme;
  }

  void toggle() {
    if (themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}

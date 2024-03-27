import 'package:flutter/material.dart';
import 'package:music_app/components/Themes/dark_theme.dart';
import 'package:music_app/components/Themes/light_theme.dart';

class ThemesProvider with ChangeNotifier {
  ThemeData _themeData = lightTheme;

  ThemeData get themeData => _themeData;
  
  bool get isDarkTheme => (themeData == darkTheme);

  set themeData(ThemeData themeData) {
    _themeData = themeData;
  }

  void toggleTheme() {
    _themeData = isDarkTheme ? lightTheme : darkTheme;
    notifyListeners();
  }
}

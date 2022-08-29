import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currenTheme = ThemeData.light();
        break;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currenTheme = ThemeData.dark();
        break;
      case 3:
        _darkTheme = false;
        _customTheme = true;
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currenTheme = ThemeData.light();
        break;
    }
  }

  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData? _currenTheme;

  bool get darkTheme => _darkTheme;

  bool get customTheme => _customTheme;

  ThemeData? get currenTheme => _currenTheme;

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    if (value) {
      _currenTheme = ThemeData.dark();
    } else {
      _currenTheme = ThemeData.light();
    }

    notifyListeners();
  }

  set customTheme(bool value) {
    _darkTheme = false;
    _customTheme = value;

    if (value) {
      _currenTheme = ThemeData.dark().copyWith(
        accentColor: Color(0xff48A0EB),
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: Color(0xff16202B),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.white
          )
        )
      );
    } else {
      _currenTheme = ThemeData.light();
    }

    notifyListeners();
  }
}

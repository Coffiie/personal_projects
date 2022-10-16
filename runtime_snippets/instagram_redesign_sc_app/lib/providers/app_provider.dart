import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  ThemeMode mode = ThemeMode.light;

  void changeTheme() {
    if (mode == ThemeMode.light) {
      mode = ThemeMode.dark;
    } else {
      mode = ThemeMode.light;
    }
    notifyListeners();
  }
}

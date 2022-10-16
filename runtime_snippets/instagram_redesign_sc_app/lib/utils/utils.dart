import 'package:flutter/material.dart';

class Utils {
  bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}

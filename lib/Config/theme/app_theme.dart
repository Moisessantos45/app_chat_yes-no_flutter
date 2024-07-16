import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF0B7FEB);

const List<Color> _colorThemes = [
  _customColor,
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectorColor;

  AppTheme({this.selectorColor = 0})
      : assert(selectorColor >= 0 && selectorColor < _colorThemes.length);

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectorColor],
    );
  }
}

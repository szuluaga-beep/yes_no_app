import 'package:flutter/material.dart';

const Color _customTheme = Color(0xFFFCA311);

const List<Color> _colorThemes = [
  _customTheme,
  Color(0x9B0066FF),
];

class AppTheme {
  final int selectedColor;
  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            'Colors must be between 0 and ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
        colorSchemeSeed: _colorThemes[selectedColor],
        // brightness: Brightness.light
        );
  }
}

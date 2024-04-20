import 'package:flutter/material.dart';

const Color _primaryColor = Color(0xFF31304D);

const List<Color> _accentColors = [
  _primaryColor,
  Color(0xFFF1FAEE),
  Color(0xFFA8DADC),
  Color(0xFF457B9D),
  Color(0xFF1D3557),
];

class AppTheme {
  final int primaryColorIndex;

  AppTheme({
    this.primaryColorIndex = 0,
  }) : assert(
            primaryColorIndex >= 0 && primaryColorIndex < _accentColors.length,
            'Invalid primaryColorIndex must be between 0 and ${_accentColors.length - 1}');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _accentColors[primaryColorIndex],
      brightness: Brightness.dark,
    );
  }
}

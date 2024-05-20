import 'package:flutter/material.dart';

/// In this file, we define the primary color and accent colors
/// used in the application.

/// The primary color used in the application.
const Color _primaryColor = Color(0xFF31304D);

/// List of accent colors used in the application.
const List<Color> _accentColors = [
  _primaryColor, // Primary color
  Color(0xFFF1FAEE), // Accent color 1
  Color(0xFFA8DADC), // Accent color 2
  Color(0xFF457B9D), // Accent color 3
  Color(0xFF1D3557), // Accent color 4
];

/// A class that defines the theme for the application.
class AppTheme {
  /// The index of the primary color in the [_accentColors] list.
  ///
  /// Must be a valid index within the range of the list.
  final int primaryColorIndex;

  /// Creates an instance of [AppTheme].
  ///
  /// The [primaryColorIndex] defaults to 0 and must be between 0 and the length
  /// of [_accentColors] - 1.
  AppTheme({
    this.primaryColorIndex = 0,
  }) : assert(
            primaryColorIndex >= 0 && primaryColorIndex < _accentColors.length,
            'Invalid primaryColorIndex must be between 0 and ${_accentColors.length - 1}');

  /// Returns a [ThemeData] object configured with Material 3, using the selected
  /// accent color and dark brightness.
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _accentColors[primaryColorIndex],
      brightness: Brightness.dark,
    );
  }
}

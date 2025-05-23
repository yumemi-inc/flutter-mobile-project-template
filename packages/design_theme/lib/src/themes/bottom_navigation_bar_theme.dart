import 'package:flutter/material.dart';

/// Create a light [BottomNavigationBarThemeData].
BottomNavigationBarThemeData get lightBottomNavigationBarTheme =>
    _createBottomNavigationBarTheme();

/// Create a dark [BottomNavigationBarThemeData].
BottomNavigationBarThemeData get darkBottomNavigationBarTheme =>
    _createBottomNavigationBarTheme();

/// Create a [BottomNavigationBarThemeData].
///
/// Different values are received as arguments for each light and dark theme,
/// and common values are set within the function.
///
/// ```dart
/// BottomNavigationBarThemeData get lightBottomNavigationBarTheme =>
///     _createBottomNavigationBarTheme(
///       backgroundColor: lightColorScheme.primaryContainer,
///    );
/// ```
BottomNavigationBarThemeData _createBottomNavigationBarTheme({
  Color? backgroundColor,
}) =>
    BottomNavigationBarThemeData(
      backgroundColor: backgroundColor,
      // example:
      // enableFeedback: true,
    );

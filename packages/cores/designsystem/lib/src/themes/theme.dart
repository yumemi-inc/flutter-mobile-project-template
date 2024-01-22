import 'package:cores_designsystem/src/themes/app_bar_theme.dart';
import 'package:cores_designsystem/src/themes/bottom_navigation_bar_theme.dart';
import 'package:cores_designsystem/src/themes/color_schemes.g.dart';
import 'package:flutter/material.dart';

/// Create a light theme.
ThemeData lightTheme({ColorScheme? colorScheme}) => _createTheme(
      colorScheme: colorScheme ?? lightColorScheme,
      appBarTheme: lightAppBarTheme,
      bottomNavigationBarTheme: lightBottomNavigationBarTheme,
    );

/// Create a dark theme.
ThemeData darkTheme({ColorScheme? colorScheme}) => _createTheme(
      colorScheme: colorScheme ?? darkColorScheme,
      appBarTheme: darkAppBarTheme,
      bottomNavigationBarTheme: darkBottomNavigationBarTheme,
    );

ThemeData _createTheme({
  required ColorScheme colorScheme,
  required AppBarTheme appBarTheme,
  required BottomNavigationBarThemeData bottomNavigationBarTheme,
}) =>
    ThemeData(
      colorScheme: colorScheme,
      appBarTheme: appBarTheme,
      bottomNavigationBarTheme: bottomNavigationBarTheme,
    );

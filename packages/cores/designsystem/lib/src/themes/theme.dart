import 'package:cores_designsystem/src/themes/color_schemes.g.dart';
import 'package:flutter/material.dart';

/// Create a light theme.
ThemeData lightTheme({ColorScheme? colorScheme}) => _createTheme(
      colorScheme: colorScheme ?? lightColorScheme,
    );

/// Create a dark theme.
ThemeData darkTheme({ColorScheme? colorScheme}) => _createTheme(
      colorScheme: colorScheme ?? darkColorScheme,
    );

ThemeData _createTheme({
  required ColorScheme colorScheme,
}) =>
    ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
    );

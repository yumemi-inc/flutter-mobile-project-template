import 'package:cores_designsystem/src/themes/color_schemes.g.dart';
import 'package:flutter/material.dart';

/// Create a light theme for AppBar.
AppBarTheme get lightAppBarTheme => _createAppBarTheme(
      backgroundColor: lightColorScheme.primaryContainer,
    );

/// Create a dark theme for AppBar.
AppBarTheme get darkAppBarTheme => _createAppBarTheme();

/// Create a theme for AppBar.
AppBarTheme _createAppBarTheme({
  Color? backgroundColor,
}) =>
    AppBarTheme(
      backgroundColor: backgroundColor,
    );

import 'package:cores_designsystem/src/themes/color_schemes.g.dart';
import 'package:flutter/material.dart';

/// Create a light [AppBarTheme].
AppBarTheme get lightAppBarTheme => _createAppBarTheme(
      backgroundColor: lightColorScheme.primaryContainer,
    );

/// Create a dark [AppBarTheme].
AppBarTheme get darkAppBarTheme => _createAppBarTheme();

/// Create a [AppBarTheme].
AppBarTheme _createAppBarTheme({
  Color? backgroundColor,
}) =>
    AppBarTheme(
      backgroundColor: backgroundColor,
    );

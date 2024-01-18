import 'package:flutter/material.dart';

/// Create a light [AppBarTheme].
AppBarTheme get lightAppBarTheme => _createAppBarTheme();

/// Create a dark [AppBarTheme].
AppBarTheme get darkAppBarTheme => _createAppBarTheme();

/// Create a [AppBarTheme].
AppBarTheme _createAppBarTheme({
  Color? backgroundColor,
}) =>
    AppBarTheme(
      backgroundColor: backgroundColor,
    );

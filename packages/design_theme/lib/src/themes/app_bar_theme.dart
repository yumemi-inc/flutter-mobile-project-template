import 'package:flutter/material.dart';

/// Create a light [AppBarTheme].
AppBarTheme get lightAppBarTheme => _createAppBarTheme();

/// Create a dark [AppBarTheme].
AppBarTheme get darkAppBarTheme => _createAppBarTheme();

/// Create a [AppBarTheme].
///
/// Different values are received as arguments for each light and dark theme,
/// and common values are set within the function.
///
/// ```dart
/// AppBarTheme get lightAppBarTheme => _createAppBarTheme(
///       backgroundColor: lightColorScheme.primaryContainer,
///     );
/// ```
AppBarTheme _createAppBarTheme({
  Color? backgroundColor,
}) =>
    AppBarTheme(
      backgroundColor: backgroundColor,
      // example:
      // centerTitle: true,
    );

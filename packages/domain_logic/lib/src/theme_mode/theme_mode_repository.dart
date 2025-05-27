import 'package:flutter/material.dart';

abstract class ThemeModeRepository {
  ThemeMode getThemeMode();
  Future<void> saveThemeMode(ThemeMode themeMode);
}

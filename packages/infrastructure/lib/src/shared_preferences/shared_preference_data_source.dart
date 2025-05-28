import 'package:flutter/material.dart';
import 'package:internal_infrastructure/internal_infrastructure.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceDataSource {
  const SharedPreferenceDataSource(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  ThemeMode getThemeMode() {
    final themeIndex = _sharedPreferences.getInt(
      SharedPreferencesKeys.themeMode.name,
    );
    return ThemeMode.values.singleWhere(
      (themeMode) => themeMode.index == themeIndex,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> saveThemeMode(int themeIndex) async {
    await _sharedPreferences.setInt(
      SharedPreferencesKeys.themeMode.name,
      themeIndex,
    );
  }
}

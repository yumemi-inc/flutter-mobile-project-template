import 'package:flutter/material.dart';
import 'package:internal_domain_logic/internal_domain_logic.dart';
import 'package:internal_infrastructure/src/shared_preferences/shared_preference_data_source.dart';

class ThemeModeRepositoryImpl implements ThemeModeRepository {
  const ThemeModeRepositoryImpl(this._sharedPreference);

  final SharedPreferenceDataSource _sharedPreference;

  @override
  ThemeMode getThemeMode() {
    return _sharedPreference.getThemeMode();
  }

  @override
  Future<void> saveThemeMode(ThemeMode themeMode) async {
    await _sharedPreference.saveThemeMode(themeMode.index);
  }
}

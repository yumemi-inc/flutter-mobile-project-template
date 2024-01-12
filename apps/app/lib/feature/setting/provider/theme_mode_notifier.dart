import 'package:flutter/material.dart';
import 'package:flutter_app/data/provider/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode_notifier.g.dart';

const _themePrefsKey = 'selectedTheme';

@Riverpod(keepAlive: true)
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  ThemeMode build() {
    return _getThemeMode();
  }

  ThemeMode _getThemeMode() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final themeIndex = prefs.getInt(SharedPreferencesKeys.theme.name);
    return ThemeMode.values.singleWhere(
      (themeMode) => themeMode.index == themeIndex,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> changeThemeMode(ThemeMode theme) async {
    await _saveThemeMode(theme.index);
    state = theme;
  }

  Future<void> _saveThemeMode(int themeIndex) async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setInt(SharedPreferencesKeys.theme.name, themeIndex);
  }
}

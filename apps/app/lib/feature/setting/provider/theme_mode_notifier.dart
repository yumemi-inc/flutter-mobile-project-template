import 'package:flutter/material.dart';
import 'package:flutter_app/data/provider/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode_notifier.g.dart';

const _themePrefsKey = 'selectedTheme';

@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  ThemeMode build() {
    return _getThemeMode();
  }

  ThemeMode _getThemeMode() {
    final prefs = ref.read(sharedPreferencesProvider);
    final themeIndex = prefs.getInt(_themePrefsKey);
    return ThemeMode.values.singleWhere(
      (themeMode) => themeMode.index == themeIndex,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> changeTheme(ThemeMode theme) async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setInt(_themePrefsKey, theme.index);
    state = theme;
  }
}

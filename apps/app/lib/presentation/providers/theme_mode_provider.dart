import 'package:flutter/material.dart';
import 'package:flutter_app/composition_root/repositories/theme_mode_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode_provider.g.dart';

@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  ThemeMode build() {
    final repository = ref.watch(themeModeRepositoryProvider);
    return repository.getThemeMode();
  }

  Future<void> changeThemeMode(ThemeMode theme) async {
    final repository = ref.read(themeModeRepositoryProvider);
    await repository.saveThemeMode(theme);
    state = theme;
  }
}

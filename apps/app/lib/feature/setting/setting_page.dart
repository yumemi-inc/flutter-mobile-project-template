import 'package:flutter/material.dart';
import 'package:flutter_app/feature/setting/provider/theme_mode_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentThemeMode = ref.watch(themeModeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('テーマ設定'),
      ),
      body: ListView.builder(
        itemCount: ThemeMode.values.length,
        itemBuilder: (context, index) {
          final themeMode = ThemeMode.values[index];

          return RadioListTile(
            value: themeMode,
            groupValue: currentThemeMode,
            onChanged: (newThemeMode) {
              ref
                  .read(themeModeNotifierProvider.notifier)
                  .changeTheme(newThemeMode!);
            },
            title: Text(themeMode.name),
          );
        },
      ),
    );
  }
}

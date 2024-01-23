import 'package:cores_data/theme_mode.dart';
import 'package:flutter/material.dart';
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
            onChanged: (newThemeMode) async {
              if (newThemeMode == null) {
                return;
              }

              await ref
                  .read(themeModeNotifierProvider.notifier)
                  .changeThemeMode(newThemeMode);
            },
            title: Text(themeMode.name),
          );
        },
      ),
    );
  }
}

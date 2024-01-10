import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            groupValue: '',
            onChanged: (newTheme) {},
            title: Text(themeMode.name),
          );
        },
      ),
    );
  }
}

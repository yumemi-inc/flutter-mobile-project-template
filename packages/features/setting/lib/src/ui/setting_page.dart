import 'package:cores_data/theme_mode.dart';
import 'package:features_setting/src/gen/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentThemeMode = ref.watch(themeModeNotifierProvider);
    final l10n = L10nSetting.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingAppBar),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.builder(
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
        ],
      ),
    );
  }
}

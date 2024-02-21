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
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 24,
            ),
            sliver: SliverToBoxAdapter(
              child: Text(l10n.settingThemeSetting),
            ),
          ),
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
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 32,
                    left: 24,
                    right: 24,
                    bottom: 16,
                  ),
                  child: Text(l10n.settingAbout),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  leading: const Icon(Icons.description),
                  title: Text(l10n.settingOpenSourceLicenses),
                  subtitle: Text(l10n.settingLibrariesWeUse),
                  onTap: () => {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

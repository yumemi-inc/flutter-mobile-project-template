import 'package:cores_core/provider.dart';
import 'package:cores_data/theme_mode.dart';
import 'package:features_setting/src/gen/assets/assets.gen.dart';
import 'package:features_setting/src/gen/l10n/l10n.dart';
import 'package:features_setting/src/ui/components/setting_section_spacer.dart';
import 'package:features_setting/src/ui/components/setting_section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setting_page.g.dart';

abstract interface class SettingPageNavigator {
  void goLicensePage(BuildContext context);
}

@Riverpod(dependencies: [])
SettingPageNavigator settingPageNavigator(Ref ref) =>
    throw UnimplementedError();

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigator = ref.watch(settingPageNavigatorProvider);
    final currentThemeMode = ref.watch(themeModeNotifierProvider);
    final buildConfig = ref.watch(buildConfigProvider);
    final l10n = L10n.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingAppBar),
      ),
      body: CustomScrollView(
        slivers: [
          SettingSectionTitle(text: l10n.settingThemeSetting),
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
          const SettingSectionSpacer(),
          SettingSectionTitle(text: l10n.settingAbout),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // 同一パッケージのassetsはこのように使います
                // 汎用的なassetsはcores_designsystemのCommonAssetsを使います
                Assets.yumemiLogo.image(
                  width: 100,
                  height: 100,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  leading: const Icon(Icons.description),
                  title: Text(l10n.settingOpenSourceLicenses),
                  subtitle: Text(l10n.settingLibrariesWeUse),
                  onTap: () => navigator.goLicensePage(context),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  leading: const Icon(Icons.info_outline),
                  title: Text(l10n.settingVersion),
                  subtitle: Text(buildConfig.version),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

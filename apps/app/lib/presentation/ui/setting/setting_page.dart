import 'package:flutter/material.dart';
import 'package:flutter_app/gen/assets/assets.gen.dart';
import 'package:flutter_app/gen/l10n/l10n.dart';
import 'package:flutter_app/presentation/providers/build_config_provider.dart';
import 'package:flutter_app/presentation/providers/theme_setting_provider.dart';
import 'package:flutter_app/presentation/ui/setting/components/setting_section_spacer.dart';
import 'package:flutter_app/presentation/ui/setting/components/setting_section_title.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internal_domain_model/internal_domain_model.dart';
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
    final currentThemeSetting = ref.watch(themeSettingNotifierProvider);
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
            itemCount: ThemeSetting.values.length,
            itemBuilder: (context, index) {
              final themeSetting = ThemeSetting.values[index];

              return RadioListTile(
                value: themeSetting,
                groupValue: currentThemeSetting,
                onChanged: (newThemeSetting) async {
                  if (newThemeSetting == null) {
                    return;
                  }

                  await ref
                      .read(themeSettingNotifierProvider.notifier)
                      .changeThemeSetting(newThemeSetting);
                },
                title: Text(themeSetting.name),
              );
            },
          ),
          const SettingSectionSpacer(),
          SettingSectionTitle(text: l10n.settingAbout),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // 同一パッケージのassetsはこのように使います
                // 汎用的なassetsはinternal_design_uiのCommonAssetsを使います
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

import 'package:flutter/material.dart';
import 'package:flutter_app/gen/assets/assets.gen.dart';
import 'package:flutter_app/presentation/providers/build_config_provider.dart';
import 'package:flutter_app/presentation/providers/theme_setting_provider.dart';
import 'package:flutter_app/presentation/ui/setting/components/setting_section_spacer.dart';
import 'package:flutter_app/presentation/ui/setting/components/setting_section_title.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internal_design_ui/i18n.dart';
import 'package:internal_domain_model/theme_setting/theme_setting.dart';

abstract interface class SettingPageNavigator {
  void goLicensePage(BuildContext context);
}

class SettingPage extends ConsumerWidget {
  const SettingPage({
    super.key,
    required this.navigator,
  });

  final SettingPageNavigator navigator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentThemeSetting = ref.watch(themeSettingNotifierProvider);
    final buildConfig = ref.watch(buildConfigProvider);
    final t = Translations.of(context).setting;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.appBarTitle),
      ),
      body: CustomScrollView(
        slivers: [
          SettingSectionTitle(text: t.themeSettingLabel),
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
          SettingSectionTitle(text: t.aboutLabel),
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
                  title: Text(t.openSourceLicensesLabel),
                  subtitle: Text(t.librariesWeUseLabel),
                  onTap: () => navigator.goLicensePage(context),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  leading: const Icon(Icons.info_outline),
                  title: Text(t.versionLabel),
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

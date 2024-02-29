import 'package:cores_core/app_status.dart';
import 'package:cores_core/exception.dart';
import 'package:cores_core/provider.dart';
import 'package:cores_core/ui.dart';
import 'package:cores_data/theme_mode.dart';
import 'package:cores_designsystem/themes.dart';
import 'package:cores_init/provider.dart';
import 'package:features_setting/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app_initializer.dart';
import 'package:flutter_app/gen/l10n/l10n.dart';
import 'package:flutter_app/router/provider/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final (buildConfig: buildConfig) = await AppInitializer.initialize();

  runApp(
    ProviderScope(
      overrides: [
        ...await initializeProviders(),
        buildConfigProvider.overrideWithValue(buildConfig),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeNotifierProvider);

    ref.listen<AppException?>(
      appExceptionNotifierProvider,
      (_, appException) {
        if (appException != null) {
          SnackBarManager.showSnackBar(
            'An error occurred: ${appException.message}',
          );
          ref.read(appExceptionNotifierProvider.notifier).consume();
        }
      },
    );

    ref.listen<AppStatus>(appStatusProvider, (_, appStatus) {
      final forceUpdateEnabled = appStatus.forceUpdateStatus.enabled;
      if (forceUpdateEnabled) {
        SnackBarManager.showSnackBar(
          'Force Update is required.',
        );
        ref.read(forceUpdateProvider.notifier).disable();
      }
    });

    return MaterialApp.router(
      localizationsDelegates: const [
        ...L10n.localizationsDelegates,
        ...L10nSetting.localizationsDelegates,
      ],
      supportedLocales: const [
        ...L10n.supportedLocales,
        ...L10nSetting.supportedLocales,
      ],
      scaffoldMessengerKey: SnackBarManager.rootScaffoldMessengerKey,
      routerConfig: ref.watch(routerProvider),
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: themeMode,
    );
  }
}

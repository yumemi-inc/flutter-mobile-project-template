import 'dart:async';

import 'package:cores_core/exception.dart';
import 'package:cores_core/ui.dart';
import 'package:cores_data/theme_mode.dart';
import 'package:cores_designsystem/themes.dart';
import 'package:features_force_update/force_update.dart';
import 'package:features_maintain/l10n.dart';
import 'package:features_setting/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/app_initializer.dart';
import 'package:flutter_app/gen/l10n/l10n.dart';
import 'package:flutter_app/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final (overrideProviders: overrideProviders,) =
      await AppInitializer.initialize();

  runApp(
    ProviderScope(
      overrides: [
        ...overrideProviders,
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
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

    ref.listen<ForceUpdateSettingsState>(forceUpdateProvider, (_, forceUpdateStatus) {
      final forceUpdateEnabled = forceUpdateStatus.enabled;
      if (forceUpdateEnabled) {
        SnackBarManager.showSnackBar(
          'Force Update is required.',
        );
        ref.read(forceUpdateProvider.notifier).disable();
      }
    });

    return MaterialApp.router(
      localizationsDelegates: const [
        ...MaintainL10n.localizationsDelegates,
        ...L10n.localizationsDelegates,
        ...SettingL10n.localizationsDelegates,
      ],
      supportedLocales: const [
        ...MaintainL10n.supportedLocales,
        ...L10n.supportedLocales,
        ...SettingL10n.supportedLocales,
      ],
      scaffoldMessengerKey: SnackBarManager.rootScaffoldMessengerKey,
      routerConfig: ref.watch(routerProvider),
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: themeMode,
      shortcuts: kDebugMode
          ? {
              LogicalKeySet(
                LogicalKeyboardKey.shift,
                LogicalKeyboardKey.keyD,
              ): const _DebugIntent(),
            }
          : null,
      actions: kDebugMode
          ? <Type, Action<Intent>>{
              _DebugIntent: CallbackAction<_DebugIntent>(
                onInvoke: (_) => unawaited(
                  router.push(const DebugPageRoute().location),
                ),
              ),
            }
          : null,
    );
  }
}

class _DebugIntent extends Intent {
  const _DebugIntent();
}

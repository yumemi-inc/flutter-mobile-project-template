import 'dart:async';

import 'package:cores_core/exception.dart';
import 'package:cores_core/ui.dart';
import 'package:cores_data/theme_mode.dart';
import 'package:cores_designsystem/themes.dart';
import 'package:cores_ui/l10n.dart';
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

  LicenseRegistry.addLicense(() async* {
    yield _yumemiMobileProjectTemplateLicense();
  });

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

    ref.listen(forceUpdateProvider, (_, forceUpdateSettingsState) {
      final forceUpdateEnabled = forceUpdateSettingsState.enabled;
      if (forceUpdateEnabled) {
        SnackBarManager.showSnackBar(
          'Force Update is required.',
        );
        ref.read(forceUpdateProvider.notifier).disable();
      }
    });

    return MaterialApp.router(
      localizationsDelegates: const [
        ...CoresUiL10n.localizationsDelegates,
        ...MaintainL10n.localizationsDelegates,
        ...L10n.localizationsDelegates,
        ...SettingL10n.localizationsDelegates,
      ],
      supportedLocales: const [
        ...CoresUiL10n.supportedLocales,
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

LicenseEntryWithLineBreaks _yumemiMobileProjectTemplateLicense() {
  return const LicenseEntryWithLineBreaks(
    ['YUMEMI Mobile Project Template'],
    '''
MIT License

Copyright (c) 2023 YUMEMI Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
      ''',
  );
}

class _DebugIntent extends Intent {
  const _DebugIntent();
}

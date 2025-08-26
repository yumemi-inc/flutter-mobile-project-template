import 'dart:async';

import 'package:cores_core/ui.dart';
import 'package:cores_data/theme_mode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/app_initializer.dart';
import 'package:flutter_app/gen/l10n/l10n.dart';
import 'package:flutter_app/presentation/providers/force_update_provider.dart';
import 'package:flutter_app/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internal_debug/ui.dart';
import 'package:internal_design_theme/themes.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  LicenseRegistry.addLicense(() async* {
    yield _yumemiMobileProjectTemplateLicense();
  });

  final (
    overrideProviders: overrideProviders,
  ) = await AppInitializer.initialize();
  final overrideObservers = <ProviderObserver>[];

  if (kDebugMode) {
    final talker = TalkerFlutter.init(settings: TalkerSettings());
    overrideProviders.add(talkerProvider.overrideWithValue(talker));
    overrideObservers.add(TalkerRiverpodObserver(talker: talker));
  }

  runApp(
    ProviderScope(
      overrides: overrideProviders,
      observers: overrideObservers,
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

    final enableAccessibilityTools =
        kDebugMode && ref.watch(enableAccessibilityToolsProvider);

    ref.listen(forceUpdateProvider, (_, forceUpdateSettingsState) {
      final message = switch (forceUpdateSettingsState) {
        AsyncError(:final error) => 'Failed to check for updates: $error',
        AsyncData(:final value) =>
          value.enabled ? 'Force Update is required.' : null,
        _ => null,
      };

      if (message == null) {
        return;
      }

      SnackBarManager.showSnackBar(message);
      ref.read(forceUpdateProvider.notifier).disable();
    });

    return MaterialApp.router(
      localizationsDelegates: const [
        ...L10n.localizationsDelegates,
      ],
      supportedLocales: const [
        ...L10n.supportedLocales,
      ],
      scaffoldMessengerKey: SnackBarManager.rootScaffoldMessengerKey,
      builder: enableAccessibilityTools
          ? (context, child) => AccessibilityTools(child: child)
          : null,
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

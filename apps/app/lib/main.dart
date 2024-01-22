import 'package:cores_core/exception.dart';
import 'package:cores_designsystem/themes.dart';
import 'package:cores_init/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/feature/setting/provider/theme_mode_notifier.dart';
import 'package:flutter_app/router/provider/router.dart';
import 'package:flutter_app/util/logger.dart';
import 'package:flutter_app/util/snack_bar_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final packageInfo = await PackageInfo.fromPlatform();
  logger.info(packageInfo);

  runApp(
    ProviderScope(
      overrides: await initializeProviders(),
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

    return MaterialApp.router(
      scaffoldMessengerKey: SnackBarManager.rootScaffoldMessengerKey,
      routerConfig: ref.watch(routerProvider),
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: themeMode,
    );
  }
}

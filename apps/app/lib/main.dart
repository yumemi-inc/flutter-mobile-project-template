import 'package:cores_designsystem/themes.dart';
import 'package:cores_init/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/app_exception.dart';
import 'package:flutter_app/feature/home/ui/home_page.dart';
import 'package:flutter_app/feature/setting/provider/theme_mode_notifier.dart';
import 'package:flutter_app/util/logger.dart';
import 'package:flutter_app/util/provider/app_exception_notifier_provider.dart';
import 'package:flutter_app/util/snack_bar_manager.dart';
import 'package:flutter_app/util/widget/custom_app_lifecyle_listerner.dart';
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

    return MaterialApp(
      scaffoldMessengerKey: SnackBarManager.rootScaffoldMessengerKey,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: themeMode,
      home: CustomAppLifecycleListener(
        onResume: () {
          // Example: Obtain the latest AppStatus and update if needed.
        },
        child: const HomePage(),
      ),
    );
  }
}

import 'package:cores_designsystem/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/provider/shared_preferences.dart';
import 'package:flutter_app/feature/home/ui/home_page.dart';
import 'package:flutter_app/feature/setting/provider/theme_mode_notifier.dart';
import 'package:flutter_app/util/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final packageInfo = await PackageInfo.fromPlatform();
  logger.info(packageInfo);

  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
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

    return MaterialApp(
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: themeMode,
      home: const HomePage(),
    );
  }
}

import 'package:cores_designsystem/gen/l10n/l10n.dart' as l10n;
import 'package:flutter/material.dart';
import 'package:flutter_app/feature/home/home_screen.dart';
import 'package:flutter_app/util/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final packageInfo = await PackageInfo.fromPlatform();
  logger.info(packageInfo);

  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: l10n.L10n.localizationsDelegates,
      supportedLocales: l10n.L10n.supportedLocales,
      home: HomeScreen(),
    );
  }
}

import 'package:cores_core/util.dart';
import 'package:cores_data/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Returns list of [Override] that should be applied to root [ProviderScope].
Future<List<Override>> initializeProviders() async {
  final overrides = <Override>[];

  final preferences = await SharedPreferences.getInstance();
  final packageInfo = await PackageInfo.fromPlatform();
  logger.info(packageInfo);
  overrides.addAll(
    [
      sharedPreferencesProvider.overrideWithValue(preferences),
      packageInfoProvider.overrideWithValue(packageInfo),
    ],
  );
  return overrides;
}

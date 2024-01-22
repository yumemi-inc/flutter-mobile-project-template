import 'package:cores_data/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Returns list of [Override] that should be applied to root [ProviderScope].
Future<List<Override>> initializeProviders() async {
  final overrides = <Override>[];

  final preferences = await SharedPreferences.getInstance();
  overrides.add(
    sharedPreferencesProvider.overrideWithValue(preferences),
  );

  return overrides;
}

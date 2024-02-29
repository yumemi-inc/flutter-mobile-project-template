import 'dart:async';

import 'package:cores_core/model.dart';
import 'package:cores_core/util.dart';
import 'package:flutter_app/app_build_config.dart';
import 'package:package_info_plus/package_info_plus.dart';

typedef InitializedValues = ({
  BuildConfig buildConfig,
});

final class AppInitializer {
  AppInitializer._();

  static Future<InitializedValues> initialize() async {
    final buildConfig = await _initializeBuildConfig();

    logger.info(buildConfig);
    return (buildConfig: buildConfig);
  }

  static Future<BuildConfig> _initializeBuildConfig() async {
    final packageInfo = await PackageInfo.fromPlatform();

    return AppBuildConfig(
      // ignore: do_not_use_environment
      appFlavor: const String.fromEnvironment('flavor'),
      appName: packageInfo.appName,
      packageName: packageInfo.packageName,
      version: packageInfo.version,
      buildNumber: packageInfo.buildNumber,
      buildSignature: packageInfo.buildSignature,
      installerStore: packageInfo.installerStore,
    );
  }
}

import 'package:cores_core/model.dart';

final class AppBuildConfig implements BuildConfig {
  AppBuildConfig({
    required String appFlavor,
    required this.appName,
    required this.packageName,
    required this.version,
    required this.buildNumber,
    required this.buildSignature,
    this.installerStore,
  }) : flavor = switch (appFlavor) {
          'dev' => Flavor.dev,
          'stg' => Flavor.stg,
          'prod' => Flavor.prd,
          // default flavor
          _ => Flavor.dev,
        };

  @override
  String appName;

  @override
  String packageName;

  @override
  String version;

  @override
  String buildNumber;

  @override
  String buildSignature;

  @override
  Flavor flavor;

  @override
  String? installerStore;

  @override
  String toString() => 'AppBuildConfig('
      'appName: $appName, '
      'buildNumber: $buildNumber, '
      'packageName: $packageName, '
      'version: $version, '
      'buildSignature: $buildSignature, '
      'flavor: $flavor, '
      'installerStore: $installerStore)';
}

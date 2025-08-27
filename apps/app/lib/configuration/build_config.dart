import 'package:flutter_app/configuration/flavor.dart';

abstract interface class BuildConfig {
  abstract final String appName;
  abstract final String packageName;
  abstract final String version;
  abstract final String buildNumber;
  abstract final String buildSignature;
  abstract final Flavor flavor;
  abstract final String? installerStore;
}

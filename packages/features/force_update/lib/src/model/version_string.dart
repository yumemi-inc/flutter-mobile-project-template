import 'package:cores_core/util.dart';

extension type VersionString(String value) {
  static final empty = VersionString('');

  /// Example: '1.0.9' -> [1, 0, 9]
  List<int> get versionList {
    final versionParts = value.split('.');

    if (versionParts.length != 3) {
      logger.warning(
        'Invalid version format for Semantic Versioning: $value',
      );
      return [0, 0, 0];
    }

    try {
      return versionParts.map(int.parse).toList();
    } on FormatException catch (_) {
      logger.warning(
        '''Invalid format when attempting to parse a List into integers: $versionParts''',
      );
      return [0, 0, 0];
    }
  }
}

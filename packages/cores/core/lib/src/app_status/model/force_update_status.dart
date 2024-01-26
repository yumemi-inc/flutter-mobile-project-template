import 'package:cores_core/src/app_status/model/force_update_target_version.dart';
import 'package:cores_core/src/util/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'force_update_status.freezed.dart';

@freezed
class ForceUpdateStatus with _$ForceUpdateStatus {
  const factory ForceUpdateStatus({
    @Default(false) bool enabled,
  }) = _ForceUpdateStatus;

  const ForceUpdateStatus._();

  static bool isForceUpdateEnabled({
    required String currentVersion,
    required ForceUpdateTargetVersion forceUpdateTargetVersion,
  }) {
    /// Example: '1.0.9' -> [1, 0, 9]
    List<int> getVersionList(String version) {
      final versionParts = version.split('.');

      if (versionParts.length != 3) {
        logger.warning(
          'Invalid version format for Semantic Versioning: $version',
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

    final currentVersionList = getVersionList(currentVersion);
    List<int> targetVersionList;

    if (defaultTargetPlatform == TargetPlatform.android) {
      targetVersionList = getVersionList(forceUpdateTargetVersion.android);
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      targetVersionList = getVersionList(forceUpdateTargetVersion.ios);
    } else {
      /// If the platform is not Android / iOS, force update is always disabled.
      return false;
    }

    for (var i = 0; i < 3; ++i) {
      if (currentVersionList[i] > targetVersionList[i]) {
        /// Example:
        /// currentVersionList = [1, 1, 0]
        /// targetVersionList = [1, 0, 9]
        return false;
      } else if (currentVersionList[i] < targetVersionList[i]) {
        /// Example:
        /// currentVersionList = [1, 0, 9]
        /// targetVersionList = [1, 1, 0]
        return true;
      }
    }
    return false;
  }
}

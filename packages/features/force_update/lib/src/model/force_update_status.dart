import 'package:features_force_update/force_update_status.dart';
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
    required VersionString currentVersion,
    required ForceUpdateTargetVersion forceUpdateTargetVersion,
  }) {
    final currentVersionList = currentVersion.versionList;
    List<int> targetVersionList;

    if (defaultTargetPlatform == TargetPlatform.android) {
      targetVersionList = forceUpdateTargetVersion.android.versionList;
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      targetVersionList = forceUpdateTargetVersion.ios.versionList;
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

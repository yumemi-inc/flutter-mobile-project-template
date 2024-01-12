import 'package:flutter/foundation.dart';
import 'package:flutter_app/util/model/force_update_target_version.dart';
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
    List<int> getVersionList(String version) {
      final versionParts = version.split('.');

      if (versionParts.length != 3) {
        return [0, 0, 0];
      }

      try {
        return versionParts.map(int.parse).toList();
      } on FormatException catch (_) {
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
      // Android / iOS 以外のプラットフォームの場合、強制バージョンアップは常に無効とする
      return false;
    }

    for (var i = 0; i < 3; ++i) {
      if (currentVersionList[i] < targetVersionList[i]) {
        return true;
      }
    }

    return false;
  }
}
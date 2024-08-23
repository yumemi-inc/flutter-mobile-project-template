import 'package:features_force_update/src/model/force_update_target_version.dart';
import 'package:features_force_update/src/model/version_string.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'force_update_settings_state.freezed.dart';

@freezed
class ForceUpdateSettingsState with _$ForceUpdateSettingsState {
  const factory ForceUpdateSettingsState({
    @Default(false) bool enabled,
  }) = _ForceUpdateSettingsState;

  const ForceUpdateSettingsState._();

  static bool isForceUpdateEnabled({
    required VersionString currentVersion,
    required ForceUpdateTargetVersion forceUpdateTargetVersion,
  }) {
    final targetVersion = forceUpdateTargetVersion.defaultTargetPlatformVersion;
    if (targetVersion == null) {
      return false;
    }

    return currentVersion < targetVersion;
  }
}

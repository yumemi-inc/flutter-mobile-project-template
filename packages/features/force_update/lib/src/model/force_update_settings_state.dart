import 'package:features_force_update/src/model/force_update_target_version.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pub_semver/pub_semver.dart';

part 'force_update_settings_state.freezed.dart';

@freezed
abstract class ForceUpdateSettingsState with _$ForceUpdateSettingsState {
  const factory ForceUpdateSettingsState({
    @Default(false) bool enabled,
  }) = _ForceUpdateSettingsState;

  const ForceUpdateSettingsState._();

  static bool isForceUpdateEnabled({
    required Version currentVersion,
    required ForceUpdateTargetVersion forceUpdateTargetVersion,
  }) {
    final targetVersion = forceUpdateTargetVersion.defaultTargetPlatformVersion;
    if (targetVersion == null) {
      return false;
    }

    return currentVersion < targetVersion;
  }
}

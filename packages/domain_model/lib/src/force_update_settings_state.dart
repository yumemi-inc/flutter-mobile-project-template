import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internal_domain_model/src/force_update_target_version.dart';
import 'package:internal_domain_model/src/version_string.dart';

part 'force_update_settings_state.freezed.dart';

@freezed
abstract class ForceUpdateSettingsState with _$ForceUpdateSettingsState {
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

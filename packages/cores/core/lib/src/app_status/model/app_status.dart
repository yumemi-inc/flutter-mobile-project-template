import 'package:cores_core/src/app_status/model/force_update_status.dart';
import 'package:cores_core/src/app_status/model/maintenance_mode_status.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_status.freezed.dart';

@freezed
class AppStatus with _$AppStatus {
  const factory AppStatus({
    required MaintenanceModeStatus maintenanceModeStatus,
    required ForceUpdateStatus forceUpdateStatus,
  }) = _AppStatus;
}

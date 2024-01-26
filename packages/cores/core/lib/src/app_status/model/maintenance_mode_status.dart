import 'package:freezed_annotation/freezed_annotation.dart';

part 'maintenance_mode_status.freezed.dart';

@freezed
class MaintenanceModeStatus with _$MaintenanceModeStatus {
  const factory MaintenanceModeStatus({
    @Default(false) bool enabled,
  }) = _MaintenanceModeStatus;
}

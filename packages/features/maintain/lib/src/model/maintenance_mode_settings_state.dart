import 'package:freezed_annotation/freezed_annotation.dart';

part 'maintenance_mode_settings_state.freezed.dart';

@freezed
class MaintenanceModeSettingsState with _$MaintenanceModeSettingsState {
  const factory MaintenanceModeSettingsState({
    @Default(false) bool enabled,
  }) = _MaintenanceModeSettingsState;
}

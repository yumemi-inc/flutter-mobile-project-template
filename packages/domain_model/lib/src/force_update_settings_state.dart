import 'package:freezed_annotation/freezed_annotation.dart';

part 'force_update_settings_state.freezed.dart';

@freezed
abstract class ForceUpdateSettingsState with _$ForceUpdateSettingsState {
  const factory ForceUpdateSettingsState({
    @Default(false) bool enabled,
  }) = _ForceUpdateSettingsState;
}

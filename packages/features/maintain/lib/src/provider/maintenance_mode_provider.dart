import 'package:features_maintain/src/model/maintenance_mode_settings_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'maintenance_mode_provider.g.dart';

@Riverpod(keepAlive: true)
class MaintenanceMode extends _$MaintenanceMode {
  @override
  MaintenanceModeSettingsState build() {
    return const MaintenanceModeSettingsState();
  }

  void update({
    required bool enabled,
  }) {
    state = state.copyWith(
      enabled: enabled,
    );
  }
}

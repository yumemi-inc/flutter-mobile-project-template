import 'package:cores_core/src/app_status/model/maintenance_mode_status.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'maintenance_mode_provider.g.dart';

@Riverpod(keepAlive: true)
class MaintenanceMode extends _$MaintenanceMode {
  @override
  MaintenanceModeStatus build() {
    return const MaintenanceModeStatus();
  }

  void update({
    required bool enabled,
  }) {
    state = state.copyWith(
      enabled: enabled,
    );
  }
}

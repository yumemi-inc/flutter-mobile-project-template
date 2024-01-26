import 'package:cores_core/src/app_status/model/app_status.dart';
import 'package:cores_core/src/app_status/model/force_update_status.dart';
import 'package:cores_core/src/app_status/model/maintenance_mode_status.dart';
import 'package:cores_core/src/app_status/provider/force_update_provider.dart';
import 'package:cores_core/src/app_status/provider/maintenance_mode_provider.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_status_provider.g.dart';

@Riverpod(keepAlive: true)
AppStatus appStatus(AppStatusRef ref) {
  final maintenanceModeState = ref.watch(maintenanceModeProvider);
  final forceUpdateState = ref.watch(forceUpdateProvider);

  return AppStatus(
    maintenanceModeStatus: MaintenanceModeStatus(
      enabled: maintenanceModeState.enabled,
    ),
    forceUpdateStatus: ForceUpdateStatus(
      enabled: forceUpdateState.enabled,
    ),
  );
}

import 'package:cores_core/src/app_status/model/app_status.dart';
import 'package:cores_core/src/app_status/provider/force_update_provider.dart';
import 'package:cores_core/src/app_status/provider/maintenance_mode_provider.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_status_provider.g.dart';

@Riverpod(keepAlive: true)
AppStatus appStatus(AppStatusRef ref) {
  final maintenanceModeStatus = ref.watch(maintenanceModeProvider);
  final forceUpdateStatus = ref.watch(forceUpdateProvider);

  return AppStatus(
    maintenanceModeStatus: maintenanceModeStatus,
    forceUpdateStatus: forceUpdateStatus,
  );
}

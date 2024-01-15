import 'package:flutter_app/util/model/app_status.dart';
import 'package:flutter_app/util/model/force_update_status.dart';
import 'package:flutter_app/util/model/maintenance_mode_status.dart';
import 'package:flutter_app/util/provider/force_update_provider.dart';
import 'package:flutter_app/util/provider/maintenance_mode_provider.dart';
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

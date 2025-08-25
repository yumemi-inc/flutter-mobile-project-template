import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_app/composition_root/use_cases/check_maintenance_mode_use_case.dart';
import 'package:internal_domain_model/internal_domain_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'maintenance_mode_provider.g.dart';

@Riverpod(keepAlive: true)
class MaintenanceMode extends _$MaintenanceMode {
  @override
  Future<MaintenanceModeSettingsState> build() async {
    final enabled = await ref
        .watch(checkMaintenanceModeUseCaseProvider)
        .shouldMaintenanceMode();

    return MaintenanceModeSettingsState(
      enabled: enabled,
    );
  }

  /// メンテナンスモードを無効にする
  void disable() {
    unawaited(
      update(
        (state) => state.copyWith(
          enabled: false,
        ),
      ),
    );
  }

  /// メンテナンスモードを有効にする
  ///
  /// このメソッドはデバッグモードでのみ使用できます。
  /// デバッグモードでない場合は、[UnimplementedError] がスローされます。
  void debugEnableMaintenanceMode() {
    if (!kDebugMode) {
      throw UnimplementedError(
        'debugEnableMaintenanceMode is only available in debug mode',
      );
    }

    unawaited(
      update(
        (state) => state.copyWith(
          enabled: true,
        ),
      ),
    );
  }
}

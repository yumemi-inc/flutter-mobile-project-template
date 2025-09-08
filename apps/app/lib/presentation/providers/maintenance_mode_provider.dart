import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_app/composition_root/use_cases/check_maintenance_mode_use_case.dart';
import 'package:internal_domain_model/operational_settings/operational_settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'maintenance_mode_provider.g.dart';

@Riverpod(keepAlive: true)
class MaintenanceMode extends _$MaintenanceMode {
  @override
  Future<MaintenancePolicy> build() async {
    final enabled = await ref
        .watch(checkMaintenanceModeUseCaseProvider)
        .shouldMaintenanceMode();

    return enabled
        ? const MaintenancePolicy.enabled(message: 'メンテナンス中です')
        : const MaintenancePolicy.disabled();
  }

  /// メンテナンスモードを無効にする
  void disable() {
    unawaited(
      update(
        (state) => const MaintenancePolicy.disabled(),
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
        (state) => const MaintenancePolicy.enabled(message: 'メンテナンス中です'),
      ),
    );
  }
}

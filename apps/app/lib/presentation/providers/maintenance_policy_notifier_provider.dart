import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_app/composition_root/use_cases/get_maintenance_policy_use_case.dart';
import 'package:internal_domain_model/operational_settings/operational_settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'maintenance_policy_notifier_provider.g.dart';

@Riverpod(keepAlive: true)
class MaintenancePolicyNotifier extends _$MaintenancePolicyNotifier {
  @override
  Future<MaintenancePolicy> build() {
    final useCase = ref.watch(getMaintenancePolicyUseCaseProvider);
    return useCase.call();
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

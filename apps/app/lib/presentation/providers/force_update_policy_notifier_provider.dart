import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_app/composition_root/use_cases/get_force_update_policy_use_case.dart';
import 'package:internal_domain_model/operational_settings/operational_settings.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'force_update_policy_notifier_provider.g.dart';

@Riverpod(keepAlive: true)
class ForceUpdatePolicyNotifier extends _$ForceUpdatePolicyNotifier {
  @override
  Future<ForceUpdatePolicy> build() {
    final useCase = ref.watch(getForceUpdatePolicyUseCaseProvider);
    return useCase.call();
  }

  /// Usage case: When the user can select whether to update or not
  void disable() {
    unawaited(
      update(
        (state) => const ForceUpdatePolicy.disabled(),
      ),
    );
  }

  /// 強制更新を有効にする
  ///
  /// このメソッドはデバッグモードでのみ使用できます。
  /// デバッグモードでない場合は、[UnimplementedError] がスローされます。
  void debugEnableForceUpdate() {
    if (!kDebugMode) {
      throw UnimplementedError(
        'debugEnableForceUpdate is only available in debug mode',
      );
    }

    unawaited(
      update(
        (state) => ForceUpdatePolicy.enabled(
          minimumVersions: RequiredVersions(
            ios: Version.parse('1.0.0'),
            android: Version.parse('1.0.0'),
          ),
        ),
      ),
    );
  }
}

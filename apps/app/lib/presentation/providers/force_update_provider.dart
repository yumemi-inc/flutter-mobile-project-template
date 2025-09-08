import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_app/composition_root/use_cases/check_force_update_use_case.dart';
import 'package:flutter_app/presentation/providers/build_config_provider.dart';
import 'package:internal_domain_model/operational_settings/operational_settings.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'force_update_provider.g.dart';

@Riverpod(keepAlive: true)
class ForceUpdate extends _$ForceUpdate {
  @override
  Future<ForceUpdatePolicy> build() async {
    final currentVersion = ref.watch(
      buildConfigProvider.select((value) => value.version),
    );

    final enabled = await ref
        .watch(checkForceUpdateUseCaseProvider)
        .shouldForceUpdate(
          Version.parse(currentVersion),
        );

    return enabled
        ? ForceUpdatePolicy.enabled(
            minimumVersions: RequiredVersions(
              ios: Version.parse('1.0.0'),
              android: Version.parse('1.0.0'),
            ),
          )
        : const ForceUpdatePolicy.disabled();
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

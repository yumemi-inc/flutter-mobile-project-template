import 'dart:async';
import 'package:cores_core/provider.dart';
import 'package:features_force_update/src/data/repositories/operational_setting_repository.dart';
import 'package:features_force_update/src/domain/use_cases/check_force_update_use_case.dart';
import 'package:features_force_update/src/model/force_update_settings_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'force_update_provider.g.dart';

@riverpod
OperationalSettingRepository operationalSettingRepository(Ref ref) =>
    OperationalSettingRepository();

@riverpod
CheckForceUpdateUseCase checkForceUpdateUseCase(Ref ref) =>
    CheckForceUpdateUseCase(
      operationalSettingRepository: ref.watch(
        operationalSettingRepositoryProvider,
      ),
    );

@Riverpod(keepAlive: true)
class ForceUpdate extends _$ForceUpdate {
  @override
  Future<ForceUpdateSettingsState> build() async {
    final currentVersion = ref.watch(
      buildConfigProvider.select((value) => value.version),
    );

    final enabled = await ref
        .read(checkForceUpdateUseCaseProvider)
        .shouldForceUpdate(
          Version.parse(currentVersion),
        );

    return ForceUpdateSettingsState(
      enabled: enabled,
    );
  }

  /// Usage case: When the user can select whether to update or not
  void disable() {
    unawaited(
      update(
        (state) => state.copyWith(
          enabled: false,
        ),
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
        (state) => state.copyWith(
          enabled: true,
        ),
      ),
    );
  }
}

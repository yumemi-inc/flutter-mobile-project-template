import 'package:cores_core/src/app_status/model/force_update_status.dart';
import 'package:cores_core/src/app_status/provider/force_update_version_provider.dart';
import 'package:cores_core/src/provider/build_config_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'force_update_provider.g.dart';

@Riverpod(keepAlive: true)
class ForceUpdate extends _$ForceUpdate {
  @override
  ForceUpdateStatus build() {
    final forceUpdateVersionState = ref.watch(forceUpdateVersionProvider);
    final currentVersion = ref.watch(
      buildConfigProvider.select((value) => value.version),
    );

    final enabled = ForceUpdateStatus.isForceUpdateEnabled(
      currentVersion: currentVersion,
      forceUpdateTargetVersion: forceUpdateVersionState,
    );

    return ForceUpdateStatus(
      enabled: enabled,
    );
  }

  /// Usage case: When the user can select whether to update or not
  void disable() {
    state = state.copyWith(
      enabled: false,
    );
  }
}

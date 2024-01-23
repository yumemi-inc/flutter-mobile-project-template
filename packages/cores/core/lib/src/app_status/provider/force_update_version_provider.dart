import 'package:cores_core/src/app_status/model/force_update_target_version.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'force_update_version_provider.g.dart';

@Riverpod(keepAlive: true)
class ForceUpdateVersion extends _$ForceUpdateVersion {
  @override
  ForceUpdateTargetVersion build() {
    return const ForceUpdateTargetVersion();
  }

  void update({
    required String iosTargetVersion,
    required String androidTargetVersion,
  }) {
    state = state.copyWith(
      ios: iosTargetVersion,
      android: androidTargetVersion,
    );
  }
}

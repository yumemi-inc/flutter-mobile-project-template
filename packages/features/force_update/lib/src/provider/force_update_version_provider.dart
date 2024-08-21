import 'package:features_force_update/src/model/force_update_target_version.dart';
import 'package:features_force_update/src/model/version_string.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'force_update_version_provider.g.dart';

@Riverpod(keepAlive: true)
class ForceUpdateVersion extends _$ForceUpdateVersion {
  @override
  ForceUpdateTargetVersion build() {
    return ForceUpdateTargetVersion(
      ios: VersionString.empty,
      android: VersionString.empty,
    );
  }

  void update({
    required VersionString iosTargetVersion,
    required VersionString androidTargetVersion,
  }) {
    state = state.copyWith(
      ios: iosTargetVersion,
      android: androidTargetVersion,
    );
  }
}

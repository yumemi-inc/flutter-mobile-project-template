import 'package:features_force_update/src/model/force_update_target_version.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'force_update_version_provider.g.dart';

@Riverpod(keepAlive: true)
class ForceUpdateVersion extends _$ForceUpdateVersion {
  @override
  ForceUpdateTargetVersion build() {
    return ForceUpdateTargetVersion(
      ios: Version.none,
      android: Version.none,
    );
  }

  void update({
    required Version iosTargetVersion,
    required Version androidTargetVersion,
  }) {
    state = state.copyWith(
      ios: iosTargetVersion,
      android: androidTargetVersion,
    );
  }
}

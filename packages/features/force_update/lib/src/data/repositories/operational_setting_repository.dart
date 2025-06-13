import 'package:features_force_update/src/domain/models/operational_settings.dart';
import 'package:pub_semver/pub_semver.dart';

class OperationalSettingRepository {
  /// [OperationalSettings]を取得する
  Future<OperationalSettings> getOperationalSettings() async {
    final (maintenancePolicy, forceUpdatePolicy) = await (
      getMaintenancePolicy(),
      getForceUpdatePolicy(),
    ).wait;

    return OperationalSettings(
      maintenancePolicy: maintenancePolicy,
      forceUpdatePolicy: forceUpdatePolicy,
    );
  }

  // TODO: テストデータのため、案件に合わせて修正する
  Future<MaintenancePolicy> getMaintenancePolicy() {
    return Future.value(const MaintenancePolicy.enabled(message: 'Test'));
  }

  // TODO: テストデータのため、案件に合わせて修正する
  Future<ForceUpdatePolicy> getForceUpdatePolicy() {
    return Future.value(
      ForceUpdatePolicy.enabled(
        minimumVersions: RequiredVersions(
          ios: Version.none,
          android: Version.none,
        ),
      ),
    );
  }
}

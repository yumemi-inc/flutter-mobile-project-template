import 'package:features_force_update/src/domain/models/operational_settings.dart';

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

  // TODO: MaintenancePolicyを取得する
  Future<MaintenancePolicy> getMaintenancePolicy() async {
    return const MaintenancePolicy.disabled();
  }

  // TODO: ForceUpdatePolicyを取得する
  Future<ForceUpdatePolicy> getForceUpdatePolicy() async {
    return const ForceUpdatePolicy.disabled();
  }
}

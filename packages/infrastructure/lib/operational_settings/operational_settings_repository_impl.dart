import 'package:internal_domain_logic/operational_settings/operational_settings_repository.dart';
import 'package:internal_domain_model/operational_settings/operational_settings.dart';
import 'package:pub_semver/pub_semver.dart';

/// 運用設定集約ルートのリポジトリ実装
class OperationalSettingsRepositoryImpl
    implements OperationalSettingsRepository {
  @override
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
    return Future.value(const MaintenancePolicy.disabled());
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

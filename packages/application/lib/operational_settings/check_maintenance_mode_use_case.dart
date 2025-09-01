import 'package:internal_domain_logic/internal_domain_logic.dart';
import 'package:internal_domain_model/internal_domain_model.dart';

class CheckMaintenanceModeUseCase {
  const CheckMaintenanceModeUseCase({
    required this.operationalSettingsRepository,
  });

  final OperationalSettingsRepository operationalSettingsRepository;

  /// メンテナンスモードが有効かどうかをチェックする
  ///
  /// メンテナンスモードが有効な場合は `true` を返す
  /// メンテナンスモードが無効な場合は `false` を返す
  Future<bool> shouldMaintenanceMode() async {
    final operationalSettings = await operationalSettingsRepository
        .getOperationalSettings();

    return operationalSettings.maintenancePolicy is MaintenanceEnabled;
  }
}

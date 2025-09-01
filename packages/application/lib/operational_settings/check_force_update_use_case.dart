import 'package:internal_domain_logic/internal_domain_logic.dart';
import 'package:internal_domain_model/internal_domain_model.dart';
import 'package:pub_semver/pub_semver.dart';

class CheckForceUpdateUseCase {
  const CheckForceUpdateUseCase({required this.operationalSettingsRepository});

  final OperationalSettingsRepository operationalSettingsRepository;

  /// 強制更新が必要かどうかをチェックする
  ///
  /// [currentVersion] 現在のバージョン
  /// [os] オペレーティングシステム
  ///
  /// 強制更新が必要な場合は `true` を返す
  /// 強制更新が不要な場合は `false` を返す
  Future<bool> shouldForceUpdate(
    Version currentVersion, {
    OperatingSystem? os,
  }) async {
    final operationalSettings = await operationalSettingsRepository
        .getOperationalSettings();
    final platform = os ?? OperatingSystem.platform();

    return operationalSettings.isForceUpdateRequired(currentVersion, platform);
  }
}

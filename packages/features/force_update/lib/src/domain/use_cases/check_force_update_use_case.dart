import 'package:features_force_update/src/data/repositories/operational_setting_repository.dart';
import 'package:features_force_update/src/domain/models/operating_system.dart';
import 'package:features_force_update/src/domain/models/operational_settings.dart';
import 'package:pub_semver/pub_semver.dart';

class CheckForceUpdateUseCase {
  const CheckForceUpdateUseCase({required this.operationalSettingRepository});

  final OperationalSettingRepository operationalSettingRepository;

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
    final operationalSettings = await operationalSettingRepository
        .getOperationalSettings();
    final platform = os ?? OperatingSystem.platform();

    return switch (operationalSettings.forceUpdatePolicy) {
      ForceUpdateEnabled(:final minimumVersions) => switch (platform) {
        OperatingSystem.ios => currentVersion < minimumVersions.ios,
        OperatingSystem.android => currentVersion < minimumVersions.android,
      },
      ForceUpdateDisabled() => false,
    };
  }
}

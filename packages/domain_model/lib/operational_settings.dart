import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internal_domain_model/operating_system.dart';
import 'package:pub_semver/pub_semver.dart';

part 'operational_settings.freezed.dart';

@freezed
abstract class OperationalSettings with _$OperationalSettings {
  const factory OperationalSettings({
    required MaintenancePolicy maintenancePolicy,
    required ForceUpdatePolicy forceUpdatePolicy,
  }) = _OperationalSettings;

  const OperationalSettings._();

  /// 強制アップデートが必要かどうかを判定する
  bool isForceUpdateRequired(Version currentVersion, OperatingSystem os) {
    return switch (forceUpdatePolicy) {
      ForceUpdateEnabled(:final minimumVersions) => switch (os) {
        OperatingSystem.ios => currentVersion < minimumVersions.ios,
        OperatingSystem.android => currentVersion < minimumVersions.android,
      },
      ForceUpdateDisabled() => false,
    };
  }
}

@freezed
sealed class MaintenancePolicy with _$MaintenancePolicy {
  const factory MaintenancePolicy.enabled({
    required String message,
  }) = MaintenanceEnabled;

  const factory MaintenancePolicy.disabled() = MaintenanceDisabled;
}

@freezed
sealed class ForceUpdatePolicy with _$ForceUpdatePolicy {
  const factory ForceUpdatePolicy.enabled({
    required RequiredVersions minimumVersions,
  }) = ForceUpdateEnabled;

  const factory ForceUpdatePolicy.disabled() = ForceUpdateDisabled;
}

@freezed
sealed class RequiredVersions with _$RequiredVersions {
  const factory RequiredVersions({
    required Version ios,
    required Version android,
  }) = _RequiredVersions;

  const RequiredVersions._();

  Version getMinimumFor(OperatingSystem os) {
    return switch (os) {
      OperatingSystem.ios => ios,
      OperatingSystem.android => android,
    };
  }
}

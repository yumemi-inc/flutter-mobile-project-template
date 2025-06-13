import 'package:features_force_update/src/domain/models/operating_system.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pub_semver/pub_semver.dart';

part 'operational_settings.freezed.dart';

@freezed
sealed class OperationalSettings with _$OperationalSettings {
  const factory OperationalSettings({
    required MaintenancePolicy maintenancePolicy,
    required ForceUpdatePolicy forceUpdatePolicy,
  }) = _OperationalSettings;
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

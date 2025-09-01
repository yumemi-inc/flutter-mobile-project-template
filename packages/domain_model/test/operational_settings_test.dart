import 'package:internal_domain_model/operating_system.dart';
import 'package:internal_domain_model/operational_settings.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:test/test.dart';

void main() {
  group('OperationalSettings', () {
    test('正常系', () {
      // Arrange
      const maintenancePolicy = MaintenancePolicy.enabled(message: 'Test');
      final forceUpdatePolicy = ForceUpdatePolicy.enabled(
        minimumVersions: RequiredVersions(
          ios: Version(1, 0, 0),
          android: Version(1, 0, 0),
        ),
      );

      // Act
      final settings = OperationalSettings(
        maintenancePolicy: maintenancePolicy,
        forceUpdatePolicy: forceUpdatePolicy,
      );

      // Assert
      expect(settings.maintenancePolicy, equals(maintenancePolicy));
      expect(settings.forceUpdatePolicy, equals(forceUpdatePolicy));
    });
  });

  group('MaintenancePolicy', () {
    test('enabled', () {
      // Arrange
      const message = 'Test';

      // Act
      const policy = MaintenancePolicy.enabled(message: message);

      // Assert
      expect(policy, isA<MaintenanceEnabled>());
      expect(
        (policy as MaintenanceEnabled).message,
        equals(message),
      );
    });

    test('disabled', () {
      // Act
      const policy = MaintenancePolicy.disabled();

      // Assert
      expect(policy, isA<MaintenanceDisabled>());
    });
  });

  group('ForceUpdatePolicy', () {
    test('enabled', () {
      // Arrange
      final minimumVersions = RequiredVersions(
        ios: Version(1, 0, 0),
        android: Version(1, 0, 0),
      );

      // Act
      final policy = ForceUpdatePolicy.enabled(
        minimumVersions: minimumVersions,
      );

      // Assert
      expect(policy, isA<ForceUpdateEnabled>());
      expect(
        (policy as ForceUpdateEnabled).minimumVersions,
        equals(minimumVersions),
      );
    });

    test('disabled', () {
      // Act
      const policy = ForceUpdatePolicy.disabled();

      // Assert
      expect(policy, isA<ForceUpdateDisabled>());
    });
  });

  group('RequiredVersions', () {
    test('正常系', () {
      // Arrange
      final iosVersion = Version(1, 0, 0);
      final androidVersion = Version(1, 0, 0);

      // Act
      final versions = RequiredVersions(
        ios: iosVersion,
        android: androidVersion,
      );

      // Assert
      expect(versions.ios, equals(iosVersion));
      expect(versions.android, equals(androidVersion));
    });

    test('getMinimumFor', () {
      // Arrange
      final iosVersion = Version(1, 0, 0);
      final androidVersion = Version(2, 0, 0);
      final versions = RequiredVersions(
        ios: iosVersion,
        android: androidVersion,
      );

      // Act & Assert
      expect(
        versions.getMinimumFor(OperatingSystem.ios),
        equals(iosVersion),
      );
      expect(
        versions.getMinimumFor(OperatingSystem.android),
        equals(androidVersion),
      );
    });
  });
}

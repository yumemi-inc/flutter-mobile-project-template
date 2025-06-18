import 'package:features_force_update/src/data/repositories/operational_setting_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internal_domain_model/internal_domain_model.dart';
import 'package:pub_semver/pub_semver.dart';

void main() {
  late OperationalSettingRepository repository;

  setUp(() {
    repository = OperationalSettingRepository();
  });

  group('getOperationalSettings', () {
    test('正常系', () async {
      // Act
      final result = await repository.getOperationalSettings();

      // Assert
      expect(result, isA<OperationalSettings>());
      expect(
        result.maintenancePolicy,
        isA<MaintenanceEnabled>().having(
          (p) => p.message,
          'message',
          'Test',
        ),
      );
      expect(
        result.forceUpdatePolicy,
        isA<ForceUpdateEnabled>().having(
          (p) => p.minimumVersions,
          'minimumVersions',
          RequiredVersions(
            ios: Version.none,
            android: Version.none,
          ),
        ),
      );
    });
  });

  group('getMaintenancePolicy', () {
    test('正常系', () async {
      // Act
      final result = await repository.getMaintenancePolicy();

      // Assert
      expect(
        result,
        isA<MaintenanceEnabled>().having(
          (p) => p.message,
          'message',
          'Test',
        ),
      );
    });
  });

  group('getForceUpdatePolicy', () {
    test('正常系', () async {
      // Act
      final result = await repository.getForceUpdatePolicy();

      // Assert
      expect(
        result,
        isA<ForceUpdateEnabled>().having(
          (p) => p.minimumVersions,
          'minimumVersions',
          RequiredVersions(
            ios: Version.none,
            android: Version.none,
          ),
        ),
      );
    });
  });
}

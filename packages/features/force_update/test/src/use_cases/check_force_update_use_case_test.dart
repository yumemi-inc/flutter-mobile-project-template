import 'package:features_force_update/src/data/repositories/operational_setting_repository.dart';
import 'package:features_force_update/src/use_cases/check_force_update_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internal_domain_model/internal_domain_model.dart';

import 'package:mocktail/mocktail.dart';
import 'package:pub_semver/pub_semver.dart';

class MockOperationalSettingRepository extends Mock
    implements OperationalSettingRepository {}

void main() {
  late CheckForceUpdateUseCase useCase;
  late MockOperationalSettingRepository mockRepository;

  setUp(() {
    mockRepository = MockOperationalSettingRepository();
    useCase = CheckForceUpdateUseCase(
      operationalSettingRepository: mockRepository,
    );
  });

  group('shouldForceUpdate', () {
    test('強制更新が必要な場合（iOS）', () async {
      // Arrange
      final currentVersion = Version(1, 0, 0);
      final minimumVersion = Version(2, 0, 0);
      when(() => mockRepository.getOperationalSettings()).thenAnswer(
        (_) async => OperationalSettings(
          maintenancePolicy: const MaintenancePolicy.disabled(),
          forceUpdatePolicy: ForceUpdatePolicy.enabled(
            minimumVersions: RequiredVersions(
              ios: minimumVersion,
              android: Version.none,
            ),
          ),
        ),
      );

      // Act
      final result = await useCase.shouldForceUpdate(
        currentVersion,
        os: OperatingSystem.ios,
      );

      // Assert
      expect(result, isTrue);
    });

    test('強制更新が必要な場合（Android）', () async {
      // Arrange
      final currentVersion = Version(1, 0, 0);
      final minimumVersion = Version(2, 0, 0);
      when(() => mockRepository.getOperationalSettings()).thenAnswer(
        (_) async => OperationalSettings(
          maintenancePolicy: const MaintenancePolicy.disabled(),
          forceUpdatePolicy: ForceUpdatePolicy.enabled(
            minimumVersions: RequiredVersions(
              ios: Version.none,
              android: minimumVersion,
            ),
          ),
        ),
      );

      // Act
      final result = await useCase.shouldForceUpdate(
        currentVersion,
        os: OperatingSystem.android,
      );

      // Assert
      expect(result, isTrue);
    });

    test('強制更新が不要な場合', () async {
      // Arrange
      final currentVersion = Version(2, 0, 0);
      final minimumVersion = Version(1, 0, 0);
      when(() => mockRepository.getOperationalSettings()).thenAnswer(
        (_) async => OperationalSettings(
          maintenancePolicy: const MaintenancePolicy.disabled(),
          forceUpdatePolicy: ForceUpdatePolicy.enabled(
            minimumVersions: RequiredVersions(
              ios: minimumVersion,
              android: minimumVersion,
            ),
          ),
        ),
      );

      // Act
      final result = await useCase.shouldForceUpdate(
        currentVersion,
        os: OperatingSystem.ios,
      );

      // Assert
      expect(result, isFalse);
    });

    test('強制更新が無効な場合', () async {
      // Arrange
      final currentVersion = Version(1, 0, 0);
      when(() => mockRepository.getOperationalSettings()).thenAnswer(
        (_) async => const OperationalSettings(
          maintenancePolicy: MaintenancePolicy.disabled(),
          forceUpdatePolicy: ForceUpdatePolicy.disabled(),
        ),
      );

      // Act
      final result = await useCase.shouldForceUpdate(
        currentVersion,
        os: OperatingSystem.ios,
      );

      // Assert
      expect(result, isFalse);
    });
  });
}

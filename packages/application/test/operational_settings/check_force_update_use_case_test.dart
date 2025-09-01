import 'package:internal_application/operational_settings/check_force_update_use_case.dart';
import 'package:internal_domain_logic/operational_settings/operational_settings_repository.dart';
import 'package:internal_domain_model/operating_system.dart';
import 'package:internal_domain_model/operational_settings.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:test/test.dart';

class MockOperationalSettingsRepository extends Mock
    implements OperationalSettingsRepository {}

void main() {
  late CheckForceUpdateUseCase useCase;
  late MockOperationalSettingsRepository mockRepository;

  setUp(() {
    mockRepository = MockOperationalSettingsRepository();
    useCase = CheckForceUpdateUseCase(
      operationalSettingsRepository: mockRepository,
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

// NOTE: テストのため
// ignore_for_file: avoid_redundant_argument_values

import 'package:features_maintain/src/model/maintenance_mode_settings_state.dart';
import 'package:features_maintain/src/provider/maintenance_mode_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  ProviderContainer createContainer({
    ProviderContainer? parent,
    List<Override> overrides = const [],
    List<ProviderObserver>? observers,
  }) {
    // Create a ProviderContainer, and optionally allow specifying parameters.
    final container = ProviderContainer(
      parent: parent,
      overrides: overrides,
      observers: observers,
    );

    // When the test ends, dispose the container.
    addTearDown(container.dispose);

    return container;
  }

  group('MaintenanceMode(メンテナンスモード)', () {
    test(
      'アプリ状態が初期状態の場合_メンテナンスモードが無効であること',
      () {
        // arrange
        final container = createContainer(
          overrides: [
            maintenanceModeProvider.overrideWith(MaintenanceMode.new),
          ],
        );
        final subscription =
            container.listen(maintenanceModeProvider, (_, __) {});

        // act
        final actual = subscription.read();

        // assert
        const expected = MaintenanceModeSettingsState(
          enabled: false,
        );
        expect(actual, expected);
        subscription.close();
      },
    );

    test(
      'メンテナンスモードの状態を無効から有効に変更した場合_アプリ状態がメンテナンスモードが有効であること',
      () {
        // arrange
        final container = createContainer(
          overrides: [
            maintenanceModeProvider.overrideWith(MaintenanceMode.new),
          ],
        );
        final subscription = container.listen(
          maintenanceModeProvider,
          (_, __) {},
        );

        // act
        container.read(maintenanceModeProvider.notifier).update(enabled: true);
        final actual = subscription.read();

        // assert
        const expected = MaintenanceModeSettingsState(
          enabled: true,
        );
        expect(actual, expected);
        subscription.close();
      },
    );

    test('メンテナンスモードの状態を有効から無効に変更した場合_アプリ状態がメンテナンスモードが無効であること', () {
      // arrange
      final container = createContainer(
        overrides: [
          maintenanceModeProvider.overrideWith(MaintenanceMode.new),
        ],
      );
      // メンテナンスモードを有効に設定する
      container.read(maintenanceModeProvider.notifier).update(enabled: true);
      final subscription =
          container.listen(maintenanceModeProvider, (_, __) {});

      // act
      container.read(maintenanceModeProvider.notifier).update(enabled: false);
      final actual = subscription.read();

      // assert
      const expected = MaintenanceModeSettingsState(
        enabled: false,
      );
      expect(actual, expected);
      subscription.close();
    });
  });
}

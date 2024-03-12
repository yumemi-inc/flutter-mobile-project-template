// ignore_for_file: avoid_redundant_argument_values

import 'package:cores_core/provider.dart';
import 'package:cores_core/src/app_status/model/app_status.dart';
import 'package:cores_core/src/app_status/model/force_update_status.dart';
import 'package:cores_core/src/app_status/model/maintenance_mode_status.dart';
import 'package:cores_core/src/app_status/provider/app_status_provider.dart';
import 'package:cores_core/src/app_status/provider/force_update_provider.dart';
import 'package:cores_core/src/app_status/provider/force_update_version_provider.dart';
import 'package:cores_core/src/app_status/provider/maintenance_mode_provider.dart';
import 'package:cores_core/src/model/build_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final fakeBuildConfig = FakeBuildConfig(
    appName: 'appName',
    packageName: 'packageName',
    version: '1.0.0',
    buildNumber: '100000',
  );

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

  group('appStatusProvider(アプリ状態)', () {
    test(
      'アプリ状態が初期状態の場合_メンテナンスモードが無効かつ強制バージョンアップが無効であること',
      () {
        // arrange
        final container = createContainer(
          overrides: [
            buildConfigProvider.overrideWith(
              (ref) => fakeBuildConfig,
            ),
            maintenanceModeProvider.overrideWith(MaintenanceMode.new),
            forceUpdateVersionProvider.overrideWith(ForceUpdateVersion.new),
            forceUpdateProvider.overrideWith(ForceUpdate.new),
          ],
        );
        final subscription = container.listen(appStatusProvider, (_, __) {});

        // act
        final actual = subscription.read();

        // assert
        const expected = AppStatus(
          maintenanceModeStatus: MaintenanceModeStatus(
            enabled: false,
          ),
          forceUpdateStatus: ForceUpdateStatus(
            enabled: false,
          ),
        );
        expect(actual, expected);
        subscription.close();
      },
    );

    test(
      'メンテナンスモードの状態を無効から有効に変更した場合_アプリ状態がメンテナンスモードが有効かつ強制バージョンアップが無効であること',
      () {
        // arrange
        final container = createContainer(
          overrides: [
            buildConfigProvider.overrideWith(
              (ref) => fakeBuildConfig,
            ),
            maintenanceModeProvider.overrideWith(MaintenanceMode.new),
            forceUpdateVersionProvider.overrideWith(ForceUpdateVersion.new),
            forceUpdateProvider.overrideWith(ForceUpdate.new),
          ],
        );
        final subscription = container.listen(
          appStatusProvider,
          (_, __) {},
        );

        // act
        container.read(maintenanceModeProvider.notifier).update(enabled: true);
        final actual = subscription.read();

        // assert
        const expected = AppStatus(
          maintenanceModeStatus: MaintenanceModeStatus(
            enabled: true,
          ),
          forceUpdateStatus: ForceUpdateStatus(
            enabled: false,
          ),
        );
        expect(actual, expected);
        subscription.close();
      },
    );

    test('メンテナンスモードの状態を有効から無効に変更した場合_アプリ状態がメンテナンスモードが無効かつ強制バージョンアップが無効であること',
        () {
      // arrange
      final container = createContainer(
        overrides: [
          buildConfigProvider.overrideWith(
            (ref) => fakeBuildConfig,
          ),
          maintenanceModeProvider.overrideWith(MaintenanceMode.new),
          forceUpdateVersionProvider.overrideWith(ForceUpdateVersion.new),
          forceUpdateProvider.overrideWith(ForceUpdate.new),
        ],
      );
      // メンテナンスモードを有効に設定する
      container.read(maintenanceModeProvider.notifier).update(enabled: true);
      final subscription = container.listen(appStatusProvider, (_, __) {});

      // act
      container.read(maintenanceModeProvider.notifier).update(enabled: false);
      final actual = subscription.read();

      // assert
      const expected = AppStatus(
        maintenanceModeStatus: MaintenanceModeStatus(
          enabled: false,
        ),
        forceUpdateStatus: ForceUpdateStatus(
          enabled: false,
        ),
      );
      expect(actual, expected);
      subscription.close();
    });

    test(
      '''プラットフォームがiOS_強制バージョンアップの状態を無効から有効に変更した場合_アプリ状態がメンテナンスモードが無効かつ強制バージョンアップが有効であること''',
      () {
        // arrange
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

        final container = createContainer(
          overrides: [
            buildConfigProvider.overrideWith(
              (ref) => fakeBuildConfig,
            ),
            maintenanceModeProvider.overrideWith(MaintenanceMode.new),
            forceUpdateVersionProvider.overrideWith(ForceUpdateVersion.new),
          ],
        );
        final subscription = container.listen(appStatusProvider, (_, __) {});

        // act
        container.read(forceUpdateVersionProvider.notifier).update(
              iosTargetVersion: '1.0.1',
              androidTargetVersion: '1.0.0',
            );
        final actual = subscription.read();

        // assert
        const expected = AppStatus(
          maintenanceModeStatus: MaintenanceModeStatus(
            enabled: false,
          ),
          forceUpdateStatus: ForceUpdateStatus(
            enabled: true,
          ),
        );
        expect(actual, expected);
        subscription.close();
      },
    );

    test(
      '''プラットフォームがiOS_強制バージョンアップの状態を有効から無効に変更した場合_アプリ状態がメンテナンスモードが無効かつ強制バージョンアップが無効であること''',
      () {
        // arrange
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

        final container = createContainer(
          overrides: [
            buildConfigProvider.overrideWith(
              (ref) => fakeBuildConfig,
            ),
            maintenanceModeProvider.overrideWith(MaintenanceMode.new),
            forceUpdateVersionProvider.overrideWith(ForceUpdateVersion.new),
          ],
        );
        // 強制バージョンアップを有効に設定するする
        container.read(forceUpdateVersionProvider.notifier).update(
              iosTargetVersion: '1.0.1',
              androidTargetVersion: '1.0.0',
            );
        final subscription = container.listen(appStatusProvider, (_, __) {});

        // act
        container.read(forceUpdateProvider.notifier).disable();
        final actual = subscription.read();

        // assert
        const expected = AppStatus(
          maintenanceModeStatus: MaintenanceModeStatus(
            enabled: false,
          ),
          forceUpdateStatus: ForceUpdateStatus(
            enabled: false,
          ),
        );
        expect(actual, expected);
        subscription.close();
      },
    );

    test(
      '''プラットフォームがAndroid_強制バージョンアップの状態を無効から有効に変更した場合_アプリ状態がメンテナンスモードが無効かつ強制バージョンアップが有効であること''',
      () {
        // arrange
        debugDefaultTargetPlatformOverride = TargetPlatform.android;

        final container = createContainer(
          overrides: [
            buildConfigProvider.overrideWith(
              (ref) => fakeBuildConfig,
            ),
            maintenanceModeProvider.overrideWith(MaintenanceMode.new),
            forceUpdateVersionProvider.overrideWith(ForceUpdateVersion.new),
          ],
        );
        final subscription = container.listen(appStatusProvider, (_, __) {});

        // act
        container.read(forceUpdateVersionProvider.notifier).update(
              iosTargetVersion: '1.0.0',
              androidTargetVersion: '1.0.1',
            );
        final actual = subscription.read();

        // assert
        const expected = AppStatus(
          maintenanceModeStatus: MaintenanceModeStatus(
            enabled: false,
          ),
          forceUpdateStatus: ForceUpdateStatus(
            enabled: true,
          ),
        );
        expect(actual, expected);
        subscription.close();
      },
    );

    test(
      '''プラットフォームがAndroid_強制バージョンアップの状態を有効から無効に変更した場合_アプリ状態がメンテナンスモードが無効かつ強制バージョンアップが無効であること''',
      () {
        // arrange
        debugDefaultTargetPlatformOverride = TargetPlatform.android;

        final container = createContainer(
          overrides: [
            buildConfigProvider.overrideWith(
              (ref) => fakeBuildConfig,
            ),
            maintenanceModeProvider.overrideWith(MaintenanceMode.new),
            forceUpdateVersionProvider.overrideWith(ForceUpdateVersion.new),
          ],
        );
        // 強制バージョンアップを有効に設定する
        container.read(forceUpdateVersionProvider.notifier).update(
              iosTargetVersion: '1.0.0',
              androidTargetVersion: '1.0.1',
            );
        final subscription = container.listen(appStatusProvider, (_, __) {});

        // act
        container.read(forceUpdateProvider.notifier).disable();
        final actual = subscription.read();

        // assert
        const expected = AppStatus(
          maintenanceModeStatus: MaintenanceModeStatus(
            enabled: false,
          ),
          forceUpdateStatus: ForceUpdateStatus(
            enabled: false,
          ),
        );
        expect(actual, expected);
        subscription.close();
      },
    );

    test(
      '''プラットフォームがAndroid/iOS以外_強制バージョンアップ対象にならない_アプリ状態がメンテナンスモードが無効かつ強制バージョンアップが無効であること''',
      () {
        // arrange
        debugDefaultTargetPlatformOverride = TargetPlatform.macOS;

        final container = createContainer(
          overrides: [
            buildConfigProvider.overrideWith(
              (ref) => fakeBuildConfig,
            ),
            maintenanceModeProvider.overrideWith(MaintenanceMode.new),
            forceUpdateVersionProvider.overrideWith(ForceUpdateVersion.new),
          ],
        );
        final subscription = container.listen(appStatusProvider, (_, __) {});

        // act
        container.read(forceUpdateVersionProvider.notifier).update(
              iosTargetVersion: '1.0.1',
              androidTargetVersion: '1.0.1',
            );
        final actual = subscription.read();

        // assert
        const expected = AppStatus(
          maintenanceModeStatus: MaintenanceModeStatus(
            enabled: false,
          ),
          forceUpdateStatus: ForceUpdateStatus(
            enabled: false,
          ),
        );
        expect(actual, expected);
        subscription.close();
      },
    );
  });
}

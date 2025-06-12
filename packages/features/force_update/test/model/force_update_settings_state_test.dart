import 'package:features_force_update/force_update.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'ForceUpdateSettingsState#enabled(強制バージョンアップの対象バージョンかどうか判定する)',
    () {
      test(
        '''プラットフォームがiOS_現在のアプリバージョンよりも強制アップデートバージョンが大きい場合(パッチバージョン)_強制バージョンアップの対象であること''',
        () {
          // arrange
          debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
          final currentVersion = Version.parse('1.0.0');
          final forceUpdateTargetVersion = ForceUpdateTargetVersion(
            android: Version.parse('1.0.0'),
            ios: Version.parse('1.0.1'),
          );

          // act
          final actual = ForceUpdateSettingsState.isForceUpdateEnabled(
            currentVersion: currentVersion,
            forceUpdateTargetVersion: forceUpdateTargetVersion,
          );

          // assert
          expect(actual, true);
        },
      );

      test(
        '''プラットフォームがiOS_現在のアプリバージョンよりも強制アップデートバージョンが大きい場合(マイナーバージョン)_強制バージョンアップの対象であること''',
        () {
          // arrange
          debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
          final currentVersion = Version.parse('1.0.9');
          final forceUpdateTargetVersion = ForceUpdateTargetVersion(
            android: Version.parse('1.0.9'),
            ios: Version.parse('1.1.0'),
          );

          // act
          final actual = ForceUpdateSettingsState.isForceUpdateEnabled(
            currentVersion: currentVersion,
            forceUpdateTargetVersion: forceUpdateTargetVersion,
          );

          // assert
          expect(actual, true);
        },
      );

      test(
        '''プラットフォームがiOS_現在のアプリバージョンよりも強制アップデートバージョンが大きい場合(メジャーバージョン)_強制バージョンアップの対象であること''',
        () {
          // arrange
          debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
          final currentVersion = Version.parse('1.9.9');
          final forceUpdateTargetVersion = ForceUpdateTargetVersion(
            android: Version.parse('1.9.9'),
            ios: Version.parse('2.0.0'),
          );

          // act
          final actual = ForceUpdateSettingsState.isForceUpdateEnabled(
            currentVersion: currentVersion,
            forceUpdateTargetVersion: forceUpdateTargetVersion,
          );

          // assert
          expect(actual, true);
        },
      );

      test(
        '''プラットフォームがiOS_現在のアプリバージョンと強制アップデートバージョンが一致する場合_強制バージョンアップの対象ではないこと''',
        () {
          // arrange
          debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
          final currentVersion = Version.parse('1.0.0');
          final forceUpdateTargetVersion = ForceUpdateTargetVersion(
            android: Version.parse('1.0.0'),
            ios: Version.parse('1.0.0'),
          );

          // act
          final actual = ForceUpdateSettingsState.isForceUpdateEnabled(
            currentVersion: currentVersion,
            forceUpdateTargetVersion: forceUpdateTargetVersion,
          );

          // assert
          expect(actual, false);
        },
      );

      test(
        '''プラットフォームがiOS_現在のアプリバージョンよりも強制アップデートバージョンが小さい場合(パッチバージョン)_強制バージョンアップの対象ではないこと''',
        () {
          // arrange
          debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
          final currentVersion = Version.parse('1.0.1');
          final forceUpdateTargetVersion = ForceUpdateTargetVersion(
            android: Version.parse('1.0.1'),
            ios: Version.parse('1.0.0'),
          );

          // act
          final actual = ForceUpdateSettingsState.isForceUpdateEnabled(
            currentVersion: currentVersion,
            forceUpdateTargetVersion: forceUpdateTargetVersion,
          );

          // assert
          expect(actual, false);
        },
      );

      test(
        '''プラットフォームがiOS_現在のアプリバージョンよりも強制アップデートバージョンが小さい場合(マイナーバージョン)_強制バージョンアップの対象ではないこと''',
        () {
          // arrange
          debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
          final currentVersion = Version.parse('1.1.0');
          final forceUpdateTargetVersion = ForceUpdateTargetVersion(
            android: Version.parse('1.1.0'),
            ios: Version.parse('1.0.9'),
          );

          // act
          final actual = ForceUpdateSettingsState.isForceUpdateEnabled(
            currentVersion: currentVersion,
            forceUpdateTargetVersion: forceUpdateTargetVersion,
          );

          // assert
          expect(actual, false);
        },
      );

      test(
        '''プラットフォームがiOS_現在のアプリバージョンよりも強制アップデートバージョンが小さい場合(メジャーバージョン)_強制バージョンアップの対象ではないこと''',
        () {
          // arrange
          debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
          final currentVersion = Version.parse('2.0.0');
          final forceUpdateTargetVersion = ForceUpdateTargetVersion(
            android: Version.parse('2.0.0'),
            ios: Version.parse('1.9.9'),
          );

          // act
          final actual = ForceUpdateSettingsState.isForceUpdateEnabled(
            currentVersion: currentVersion,
            forceUpdateTargetVersion: forceUpdateTargetVersion,
          );

          // assert
          expect(actual, false);
        },
      );

      test(
        '''プラットフォームがAndroid_現在のアプリバージョンよりも強制アップデートバージョンが大きい場合(パッチバージョン)_強制バージョンアップの対象であること''',
        () {
          // arrange
          debugDefaultTargetPlatformOverride = TargetPlatform.android;
          final currentVersion = Version.parse('1.0.0');
          final forceUpdateTargetVersion = ForceUpdateTargetVersion(
            android: Version.parse('1.0.1'),
            ios: Version.parse('1.0.0'),
          );

          // act
          final actual = ForceUpdateSettingsState.isForceUpdateEnabled(
            currentVersion: currentVersion,
            forceUpdateTargetVersion: forceUpdateTargetVersion,
          );

          // assert
          expect(actual, true);
        },
      );

      test(
        '''プラットフォームがAndroid_現在のアプリバージョンよりも強制アップデートバージョンが大きい場合(マイナーバージョン)_強制バージョンアップの対象であること''',
        () {
          // arrange
          debugDefaultTargetPlatformOverride = TargetPlatform.android;
          final currentVersion = Version.parse('1.0.9');
          final forceUpdateTargetVersion = ForceUpdateTargetVersion(
            android: Version.parse('1.1.0'),
            ios: Version.parse('1.0.9'),
          );

          // act
          final actual = ForceUpdateSettingsState.isForceUpdateEnabled(
            currentVersion: currentVersion,
            forceUpdateTargetVersion: forceUpdateTargetVersion,
          );

          // assert
          expect(actual, true);
        },
      );

      test(
        '''プラットフォームがAndroid_現在のアプリバージョンよりも強制アップデートバージョンが大きい場合(メジャーバージョン)_強制バージョンアップの対象であること''',
        () {
          // arrange
          debugDefaultTargetPlatformOverride = TargetPlatform.android;
          final currentVersion = Version.parse('1.9.9');
          final forceUpdateTargetVersion = ForceUpdateTargetVersion(
            android: Version.parse('2.0.0'),
            ios: Version.parse('1.9.9'),
          );

          // act
          final actual = ForceUpdateSettingsState.isForceUpdateEnabled(
            currentVersion: currentVersion,
            forceUpdateTargetVersion: forceUpdateTargetVersion,
          );

          // assert
          expect(actual, true);
        },
      );

      test(
        '''プラットフォームがAndroid_現在のアプリバージョンと強制アップデートバージョンが一致する場合_強制バージョンアップの対象ではないこと''',
        () {
          // arrange
          debugDefaultTargetPlatformOverride = TargetPlatform.android;
          final currentVersion = Version.parse('1.0.0');
          final forceUpdateTargetVersion = ForceUpdateTargetVersion(
            android: Version.parse('1.0.0'),
            ios: Version.parse('1.0.0'),
          );

          // act
          final actual = ForceUpdateSettingsState.isForceUpdateEnabled(
            currentVersion: currentVersion,
            forceUpdateTargetVersion: forceUpdateTargetVersion,
          );

          // assert
          expect(actual, false);
        },
      );

      test(
        '''プラットフォームがAndroid_現在のアプリバージョンよりも強制アップデートバージョンが小さい場合(パッチバージョン)_強制バージョンアップの対象ではないこと''',
        () {
          // arrange
          debugDefaultTargetPlatformOverride = TargetPlatform.android;
          final currentVersion = Version.parse('1.0.1');
          final forceUpdateTargetVersion = ForceUpdateTargetVersion(
            android: Version.parse('1.0.0'),
            ios: Version.parse('1.0.1'),
          );

          // act
          final actual = ForceUpdateSettingsState.isForceUpdateEnabled(
            currentVersion: currentVersion,
            forceUpdateTargetVersion: forceUpdateTargetVersion,
          );

          // assert
          expect(actual, false);
        },
      );

      test(
        '''プラットフォームがAndroid_現在のアプリバージョンよりも強制アップデートバージョンが小さい場合(マイナーバージョン)_強制バージョンアップの対象ではないこと''',
        () {
          // arrange
          debugDefaultTargetPlatformOverride = TargetPlatform.android;
          final currentVersion = Version.parse('1.1.0');
          final forceUpdateTargetVersion = ForceUpdateTargetVersion(
            android: Version.parse('1.0.9'),
            ios: Version.parse('1.1.0'),
          );

          // act
          final actual = ForceUpdateSettingsState.isForceUpdateEnabled(
            currentVersion: currentVersion,
            forceUpdateTargetVersion: forceUpdateTargetVersion,
          );

          // assert
          expect(actual, false);
        },
      );

      test(
        '''プラットフォームがAndroid_現在のアプリバージョンよりも強制アップデートバージョンが小さい場合(メジャーバージョン)_強制バージョンアップの対象ではないこと''',
        () {
          // arrange
          debugDefaultTargetPlatformOverride = TargetPlatform.android;
          final currentVersion = Version.parse('2.0.0');
          final forceUpdateTargetVersion = ForceUpdateTargetVersion(
            android: Version.parse('1.9.9'),
            ios: Version.parse('2.0.0'),
          );

          // act
          final actual = ForceUpdateSettingsState.isForceUpdateEnabled(
            currentVersion: currentVersion,
            forceUpdateTargetVersion: forceUpdateTargetVersion,
          );

          // assert
          expect(actual, false);
        },
      );
    },
  );
}

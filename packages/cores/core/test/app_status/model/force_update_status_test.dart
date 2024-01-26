// ignore_for_file: avoid_redundant_argument_values

import 'package:cores_core/src/app_status/model/force_update_status.dart';
import 'package:cores_core/src/app_status/model/force_update_target_version.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'ForceUpdateStatus#isForceUpdateEnabled(強制バージョンアップの対象バージョンかどうか判定する)',
    () {
      test(
          '''プラットフォームがiOS_現在のアプリバージョンよりも強制アップデートバージョンが大きい場合(パッチバージョン)_強制バージョンアップの対象であること''',
          () {
        // arrange
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
        const currentVersion = '1.0.0';
        const forceUpdateTargetVersion = ForceUpdateTargetVersion(
          android: '1.0.0',
          ios: '1.0.1',
        );

        // act
        final actual = ForceUpdateStatus.isForceUpdateEnabled(
          currentVersion: currentVersion,
          forceUpdateTargetVersion: forceUpdateTargetVersion,
        );

        // assert
        expect(actual, true);
      });

      test(
          '''プラットフォームがiOS_現在のアプリバージョンよりも強制アップデートバージョンが大きい場合(マイナーバージョン)_強制バージョンアップの対象であること''',
          () {
        // arrange
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
        const currentVersion = '1.0.9';
        const forceUpdateTargetVersion = ForceUpdateTargetVersion(
          android: '1.0.9',
          ios: '1.1.0',
        );

        // act
        final actual = ForceUpdateStatus.isForceUpdateEnabled(
          currentVersion: currentVersion,
          forceUpdateTargetVersion: forceUpdateTargetVersion,
        );

        // assert
        expect(actual, true);
      });

      test(
          '''プラットフォームがiOS_現在のアプリバージョンよりも強制アップデートバージョンが大きい場合(メジャーバージョン)_強制バージョンアップの対象であること''',
          () {
        // arrange
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
        const currentVersion = '1.9.9';
        const forceUpdateTargetVersion = ForceUpdateTargetVersion(
          android: '1.9.9',
          ios: '2.0.0',
        );

        // act
        final actual = ForceUpdateStatus.isForceUpdateEnabled(
          currentVersion: currentVersion,
          forceUpdateTargetVersion: forceUpdateTargetVersion,
        );

        // assert
        expect(actual, true);
      });

      test(
          '''プラットフォームがiOS_現在のアプリバージョンと強制アップデートバージョンが一致する場合_強制バージョンアップの対象ではないこと''',
          () {
        // arrange
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
        const currentVersion = '1.0.0';
        const forceUpdateTargetVersion = ForceUpdateTargetVersion(
          android: '1.0.0',
          ios: '1.0.0',
        );

        // act
        final actual = ForceUpdateStatus.isForceUpdateEnabled(
          currentVersion: currentVersion,
          forceUpdateTargetVersion: forceUpdateTargetVersion,
        );

        // assert
        expect(actual, false);
      });

      test(
          '''プラットフォームがiOS_現在のアプリバージョンよりも強制アップデートバージョンが小さい場合(パッチバージョン)_強制バージョンアップの対象ではないこと''',
          () {
        // arrange
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
        const currentVersion = '1.0.1';
        const forceUpdateTargetVersion = ForceUpdateTargetVersion(
          android: '1.0.1',
          ios: '1.0.0',
        );

        // act
        final actual = ForceUpdateStatus.isForceUpdateEnabled(
          currentVersion: currentVersion,
          forceUpdateTargetVersion: forceUpdateTargetVersion,
        );

        // assert
        expect(actual, false);
      });

      test(
          '''プラットフォームがiOS_現在のアプリバージョンよりも強制アップデートバージョンが小さい場合(マイナーバージョン)_強制バージョンアップの対象ではないこと''',
          () {
        // arrange
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
        const currentVersion = '1.1.0';
        const forceUpdateTargetVersion = ForceUpdateTargetVersion(
          android: '1.1.0',
          ios: '1.0.9',
        );

        // act
        final actual = ForceUpdateStatus.isForceUpdateEnabled(
          currentVersion: currentVersion,
          forceUpdateTargetVersion: forceUpdateTargetVersion,
        );

        // assert
        expect(actual, false);
      });

      test(
          '''プラットフォームがiOS_現在のアプリバージョンよりも強制アップデートバージョンが小さい場合(メジャーバージョン)_強制バージョンアップの対象ではないこと''',
          () {
        // arrange
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
        const currentVersion = '2.0.0';
        const forceUpdateTargetVersion = ForceUpdateTargetVersion(
          android: '2.0.0',
          ios: '1.9.9',
        );

        // act
        final actual = ForceUpdateStatus.isForceUpdateEnabled(
          currentVersion: currentVersion,
          forceUpdateTargetVersion: forceUpdateTargetVersion,
        );

        // assert
        expect(actual, false);
      });

      test('''プラットフォームがiOS_強制アップデートバージョンが空文字の場合_強制バージョンアップの対象ではないこと''', () {
        // arrange
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
        const currentVersion = '1.0.0';
        const forceUpdateTargetVersion = ForceUpdateTargetVersion(
          android: '1.0.1',
          ios: '',
        );

        // act
        final actual = ForceUpdateStatus.isForceUpdateEnabled(
          currentVersion: currentVersion,
          forceUpdateTargetVersion: forceUpdateTargetVersion,
        );

        // assert
        expect(actual, false);
      });

      test(
          '''プラットフォームがiOS_強制アップデートバージョンにセマンティックバージョニング形式ではない場合_強制バージョンアップの対象ではないこと''',
          () {
        // arrange
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
        const currentVersion = '1.0.0';
        const forceUpdateTargetVersion = ForceUpdateTargetVersion(
          android: '100000',
          ios: '100001',
        );

        // act
        final actual = ForceUpdateStatus.isForceUpdateEnabled(
          currentVersion: currentVersion,
          forceUpdateTargetVersion: forceUpdateTargetVersion,
        );

        // assert
        expect(actual, false);
      });

      test(
          '''プラットフォームがiOS_強制アップデートバージョンに数字ではない文字列が含まれている場合_強制バージョンアップの対象ではないこと''',
          () {
        // arrange
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
        const currentVersion = '1.0.0';
        const forceUpdateTargetVersion = ForceUpdateTargetVersion(
          android: '1.0.1',
          ios: '1.0.1a',
        );

        // act
        final actual = ForceUpdateStatus.isForceUpdateEnabled(
          currentVersion: currentVersion,
          forceUpdateTargetVersion: forceUpdateTargetVersion,
        );

        // assert
        expect(actual, false);
      });

      test(
          '''プラットフォームがAndroid_現在のアプリバージョンよりも強制アップデートバージョンが大きい場合(パッチバージョン)_強制バージョンアップの対象であること''',
          () {
        // arrange
        debugDefaultTargetPlatformOverride = TargetPlatform.android;
        const currentVersion = '1.0.0';
        const forceUpdateTargetVersion = ForceUpdateTargetVersion(
          android: '1.0.1',
          ios: '1.0.0',
        );

        // act
        final actual = ForceUpdateStatus.isForceUpdateEnabled(
          currentVersion: currentVersion,
          forceUpdateTargetVersion: forceUpdateTargetVersion,
        );

        // assert
        expect(actual, true);
      });

      test(
          '''プラットフォームがAndroid_現在のアプリバージョンよりも強制アップデートバージョンが大きい場合(マイナーバージョン)_強制バージョンアップの対象であること''',
          () {
        // arrange
        debugDefaultTargetPlatformOverride = TargetPlatform.android;
        const currentVersion = '1.0.9';
        const forceUpdateTargetVersion = ForceUpdateTargetVersion(
          android: '1.1.0',
          ios: '1.0.9',
        );

        // act
        final actual = ForceUpdateStatus.isForceUpdateEnabled(
          currentVersion: currentVersion,
          forceUpdateTargetVersion: forceUpdateTargetVersion,
        );

        // assert
        expect(actual, true);
      });

      test(
          '''プラットフォームがAndroid_現在のアプリバージョンよりも強制アップデートバージョンが大きい場合(メジャーバージョン)_強制バージョンアップの対象であること''',
          () {
        // arrange
        debugDefaultTargetPlatformOverride = TargetPlatform.android;
        const currentVersion = '1.9.9';
        const forceUpdateTargetVersion = ForceUpdateTargetVersion(
          android: '2.0.0',
          ios: '1.9.9',
        );

        // act
        final actual = ForceUpdateStatus.isForceUpdateEnabled(
          currentVersion: currentVersion,
          forceUpdateTargetVersion: forceUpdateTargetVersion,
        );

        // assert
        expect(actual, true);
      });

      test(
          '''プラットフォームがAndroid_現在のアプリバージョンと強制アップデートバージョンが一致する場合_強制バージョンアップの対象ではないこと''',
          () {
        // arrange
        debugDefaultTargetPlatformOverride = TargetPlatform.android;
        const currentVersion = '1.0.0';
        const forceUpdateTargetVersion = ForceUpdateTargetVersion(
          android: '1.0.0',
          ios: '1.0.0',
        );

        // act
        final actual = ForceUpdateStatus.isForceUpdateEnabled(
          currentVersion: currentVersion,
          forceUpdateTargetVersion: forceUpdateTargetVersion,
        );

        // assert
        expect(actual, false);
      });

      test(
          '''プラットフォームがAndroid_現在のアプリバージョンよりも強制アップデートバージョンが小さい場合(パッチバージョン)_強制バージョンアップの対象ではないこと''',
          () {
        // arrange
        debugDefaultTargetPlatformOverride = TargetPlatform.android;
        const currentVersion = '1.0.1';
        const forceUpdateTargetVersion = ForceUpdateTargetVersion(
          android: '1.0.0',
          ios: '1.0.1',
        );

        // act
        final actual = ForceUpdateStatus.isForceUpdateEnabled(
          currentVersion: currentVersion,
          forceUpdateTargetVersion: forceUpdateTargetVersion,
        );

        // assert
        expect(actual, false);
      });

      test(
          '''プラットフォームがAndroid_現在のアプリバージョンよりも強制アップデートバージョンが小さい場合(マイナーバージョン)_強制バージョンアップの対象ではないこと''',
          () {
        // arrange
        debugDefaultTargetPlatformOverride = TargetPlatform.android;
        const currentVersion = '1.1.0';
        const forceUpdateTargetVersion = ForceUpdateTargetVersion(
          android: '1.0.9',
          ios: '1.1.0',
        );

        // act
        final actual = ForceUpdateStatus.isForceUpdateEnabled(
          currentVersion: currentVersion,
          forceUpdateTargetVersion: forceUpdateTargetVersion,
        );

        // assert
        expect(actual, false);
      });

      test(
          '''プラットフォームがAndroid_現在のアプリバージョンよりも強制アップデートバージョンが小さい場合(メジャーバージョン)_強制バージョンアップの対象ではないこと''',
          () {
        // arrange
        debugDefaultTargetPlatformOverride = TargetPlatform.android;
        const currentVersion = '2.0.0';
        const forceUpdateTargetVersion = ForceUpdateTargetVersion(
          android: '1.9.9',
          ios: '2.0.0',
        );

        // act
        final actual = ForceUpdateStatus.isForceUpdateEnabled(
          currentVersion: currentVersion,
          forceUpdateTargetVersion: forceUpdateTargetVersion,
        );

        // assert
        expect(actual, false);
      });

      test('''プラットフォームがAndroid_強制アップデートバージョンが空文字の場合_強制バージョンアップの対象ではないこと''', () {
        // arrange
        debugDefaultTargetPlatformOverride = TargetPlatform.android;
        const currentVersion = '1.0.0';
        const forceUpdateTargetVersion = ForceUpdateTargetVersion(
          android: '',
          ios: '1.0.1',
        );

        // act
        final actual = ForceUpdateStatus.isForceUpdateEnabled(
          currentVersion: currentVersion,
          forceUpdateTargetVersion: forceUpdateTargetVersion,
        );

        // assert
        expect(actual, false);
      });

      test(
          '''プラットフォームがAndroid_強制アップデートバージョンにセマンティックバージョニング形式ではない場合_強制バージョンアップの対象ではないこと''',
          () {
        // arrange
        debugDefaultTargetPlatformOverride = TargetPlatform.android;
        const currentVersion = '1.0.0';
        const forceUpdateTargetVersion = ForceUpdateTargetVersion(
          android: '100001',
          ios: '100000',
        );

        // act
        final actual = ForceUpdateStatus.isForceUpdateEnabled(
          currentVersion: currentVersion,
          forceUpdateTargetVersion: forceUpdateTargetVersion,
        );

        // assert
        expect(actual, false);
      });

      test(
          '''プラットフォームがAndroid_強制アップデートバージョンに数字ではない文字列が含まれている場合_強制バージョンアップの対象ではないこと''',
          () {
        // arrange
        debugDefaultTargetPlatformOverride = TargetPlatform.android;
        const currentVersion = '1.0.0';
        const forceUpdateTargetVersion = ForceUpdateTargetVersion(
          android: '1.0.1a',
          ios: '1.0.1',
        );

        // act
        final actual = ForceUpdateStatus.isForceUpdateEnabled(
          currentVersion: currentVersion,
          forceUpdateTargetVersion: forceUpdateTargetVersion,
        );

        // assert
        expect(actual, false);
      });
    },
  );
}

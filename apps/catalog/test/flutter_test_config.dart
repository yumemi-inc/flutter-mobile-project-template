import 'dart:async';

import 'package:alchemist/alchemist.dart';
import 'package:cores_designsystem/themes.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  //
  // ignore: do_not_use_environment
  const isRunningInCi = bool.fromEnvironment('CI');

  return AlchemistConfig.runWithConfig(
    config: AlchemistConfig(
      theme: lightTheme(),
      //
      // ignore: prefer_const_constructors
      platformGoldensConfig: PlatformGoldensConfig(
        //
        // ignore: avoid_redundant_argument_values
        enabled: !isRunningInCi,
      ),
    ),
    run: testMain,
  );
}

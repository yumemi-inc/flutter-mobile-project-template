import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) {
  final featureName = context.vars['feature_name'] as String;

  final isExists = Directory('packages/features/$featureName').existsSync();

  if (isExists) {
    return;
  }

  // パッケージがまだ存在しない場合は、features_package_core brickでパッケージを作成する
  Process.runSync('mason', [
    'make',
    'features_package_core',
    '--feature_name',
    featureName,
  ]);
}

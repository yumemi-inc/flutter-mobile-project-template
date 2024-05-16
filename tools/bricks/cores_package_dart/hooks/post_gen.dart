import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) {
  final packageName = (context.vars['package_name'] as String).snakeCase;
  final packageDir = '${Directory.current.path}/packages/cores/$packageName';

  Process.runSync('melos', ['bs']);

  // update yumemi_lints version
  Process.runSync(
    'fvm',
    ['dart', 'run', 'yumemi_lints', 'update'],
    workingDirectory: packageDir,
  );
}

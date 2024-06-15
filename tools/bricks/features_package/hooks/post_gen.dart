import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) {
  Process.runSync(
    'melos',
    ['bs'],
  );
  Process.runSync(
    'melos',
    ['run', 'regenerate_by_using_gen_l10n'],
  );
}

import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) {
  final featureName = context.vars['feature_name'] as String;

  // appにfeatureの依存を追加
  Process.runSync(
    'dart',
    [
      'pub',
      'add',
      // Dartバージョンが上がったらこっちの書き方に変更する
      // https://dart.dev/tools/pub/cmd/pub-add#path-1
      // '\'features_$featureName:{"path":"../../packages/features/$featureName"}\'',
      'features_$featureName',
      '--path',
      '../../packages/features/$featureName',
    ],
    workingDirectory: 'apps/app',
  );

  Process.runSync(
    'melos',
    ['bs'],
  );
  Process.runSync(
    'melos',
    ['run', 'regenerate_by_using_gen_l10n'],
  );
}

import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) {
  final featureName = context.vars['feature_name'] as String;
  final useRiverpod = context.vars['use_riverpod'] as bool;
  final useFreezed = context.vars['use_freezed'] as bool;

  _addDependency(
    featureName: featureName,
    useRiverpod: useRiverpod,
    useFreezed: useFreezed,
  );

  _replaceAnalysisOptions(
    featureName: featureName,
    useRiverpod: useRiverpod,
    useFreezed: useFreezed,
  );

  if (useRiverpod || useFreezed) {
    Process.runSync('melos', ['bs']);
  }
}

void _addDependency({
  required String featureName,
  required bool useRiverpod,
  required bool useFreezed,
}) {
  if (useRiverpod) {
    // 依存の追加
    Process.runSync(
      'dart',
      [
        'pub',
        'add',
        'flutter_hooks',
        'hooks_riverpod',
        'riverpod_annotation',
        'dev:build_runner',
        'dev:riverpod_generator',
        'dev:riverpod_lint',
        'dev:custom_lint'
      ],
      workingDirectory: 'packages/features/$featureName',
    );
  }

  if (useFreezed) {
    // 依存の追加
    Process.runSync(
      'dart',
      [
        'pub',
        'add',
        'freezed_annotation',
        'json_annotation',
        'dev:build_runner',
        'dev:freezed',
        'dev:json_serializable',
      ],
      workingDirectory: 'packages/features/$featureName',
    );
  }
}

void _replaceAnalysisOptions({
  required String featureName,
  required bool useRiverpod,
  required bool useFreezed,
}) {
  final filePath = 'packages/features/$featureName/analysis_options.yaml';

  final sb = StringBuffer();
  sb.write('''
include: package:yumemi_lints/flutter/3.22/recommended.yaml

analyzer:
''');

  if (useRiverpod) {
    sb.write('''
  plugins:
    # https://riverpod.dev/docs/introduction/getting_started#enabling-riverpod_lintcustom_lint
    - custom_lint
''');
  }
  if (useFreezed) {
    sb.write('''
  errors:
    # https://pub.dev/packages/freezed#install
    invalid_annotation_target: ignore
''');
  }

  // 変更をファイルに書き込む
  File(filePath).writeAsStringSync(sb.toString());
}

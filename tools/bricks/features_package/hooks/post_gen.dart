import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) {
  final featureName = context.vars['feature_name'] as String;
  final useRiverpod = context.vars['use_riverpod'] as bool;
  final useFreezed = context.vars['use_freezed'] as bool;

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

  if (useRiverpod || useFreezed) {
    Process.runSync('melos', ['bs']);
  }
}

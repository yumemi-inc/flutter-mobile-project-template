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

  _replaceBuildYaml(
    featureName: featureName,
    useRiverpod: useRiverpod,
    useFreezed: useFreezed,
  );

  if (useRiverpod || useFreezed) {
    Process.runSync('melos', ['bs']);
  }

  // import の並び替えなどの fix 適用
  Process.runSync('dart', ['fix', '--apply']);
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
        'dev:freezed',
        'dev:json_serializable',
      ],
      workingDirectory: 'packages/features/$featureName',
    );
  }
}

void _replaceBuildYaml({
  required String featureName,
  required bool useRiverpod,
  required bool useFreezed,
}) {
  final filePath = 'packages/features/$featureName/build.yaml';

  final sb = StringBuffer();
  sb.write('''
targets:
  \$default:
    builders:
''');

  if (useRiverpod) {
    sb.write('''
      riverpod_generator:
        generate_for:
          include:
            - lib/{provider,**/provider}/**.dart
            # ページファイル内で navigatorProvider を定義できるようにする
            - lib/**/*_page.dart
''');
  }
  if (useFreezed) {
    sb.write('''
      freezed:
        # https://github.com/dart-lang/build/blob/master/docs/faq.md#how-do-i-avoid-running-builders-on-unnecessary-inputs
        generate_for:
          include:
            - lib/{model,**/model}/**.dart
      # https://github.com/google/json_serializable.dart/tree/master/json_serializable#build-configuration
      json_serializable:
        generate_for:
          include:
            - lib/{model,**/model}/**.dart
        options:
          field_rename: snake
          # json のデシリアライズ時に発生する Exception を CheckedFromJsonException にまとめる
          checked: true
''');
  }

  if (useRiverpod || useFreezed) {
    sb.write('''
      # https://github.com/dart-lang/source_gen#ignore_for_file
      source_gen:combining_builder:
        options:
          ignore_for_file:
            - type=lint
            - duplicate_ignore
''');
  }

  // 変更をファイルに書き込む
  File(filePath).writeAsStringSync(sb.toString());
}

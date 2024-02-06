import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) {
  final brickName = context.vars['brick_name'];
  const bricksDir = './tools/bricks/';

  final List<String> args = [
    'new',
    brickName,
    '-o',
    bricksDir,
  ];

  if (context.vars['hooks']) {
    args.add('--hooks');
  }

  if (context.vars['description'].isNotEmpty) {
    final List<String> descriptionArgs = ['--desc', context.vars['description']];
    args.addAll(descriptionArgs);
  }

  // create bricks
  Process.runSync('mason', args);

  // add bricks
  Process.runSync('mason', [
    'add',
    brickName,
    '--path',
    bricksDir + brickName,
  ]);
}

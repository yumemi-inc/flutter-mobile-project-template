import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) {
  final List<String> args = ['new', context.vars['brick_name'] ,'-o', './tools/bricks'];

  if (context.vars['hooks']) {
    args.add('--hooks');
  }

  // create bricks
  Process.runSync('mason', args);

  // add bricks
  Process.runSync('mason', ['add', context.vars['brick_name'], '--path',
      './tools/bricks/${context.vars['brick_name']}']);
}

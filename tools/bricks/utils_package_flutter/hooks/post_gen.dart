import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) {
  Process.runSync('melos', ['bs']);
}

import 'dart:io';

import 'logger.dart';

String run(
  String executable, {
  List<String> arguments = const [],
  bool quiet = false,
}) {
  if (!quiet) {
    log("$executable ${arguments.join(' ')}");
  }

  final result = Process.runSync(executable, arguments);

  final stdout = result.stdout as String;
  final stderr = result.stderr as String;

  if (!quiet && stdout.isNotEmpty) {
    log(stdout.trim());
  }
  if (stderr.isNotEmpty) {
    log(stderr.trim());
  }

  if (result.exitCode != 0) {
    throw Exception('failed with exit code ${result.exitCode}');
  }

  return stdout;
}

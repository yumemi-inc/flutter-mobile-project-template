import 'package:grinder/grinder.dart';

String fetchGitRootDirPath({
  void Function()? onFailure,
}) {
  final gitRevParse = run(
    'git',
    arguments: [
      'rev-parse',
      '--show-toplevel',
    ],
    quiet: true,
  );

  return gitRevParse.trim();
}

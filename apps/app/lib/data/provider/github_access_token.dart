import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'github_access_token.g.dart';

@riverpod
String? gitHubAccessToken(GitHubAccessTokenRef ref) {
  // ignore: do_not_use_environment
  return const String.fromEnvironment('GITHUB_ACCESS_TOKEN');
}

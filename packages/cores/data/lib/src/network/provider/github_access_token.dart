// FIXME(tatsuatkein): BuildConfig で一箇所にまとめたい
// ignore_for_file: do_not_use_environment

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'github_access_token.g.dart';

const _gitHubAccessTokenKey = 'GITHUB_ACCESS_TOKEN';

@riverpod
String? gitHubAccessToken(Ref ref) {
  return const bool.hasEnvironment(_gitHubAccessTokenKey)
      ? const String.fromEnvironment(_gitHubAccessTokenKey)
      : null;
}

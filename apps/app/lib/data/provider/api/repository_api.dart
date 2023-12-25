import 'package:flutter_app/data/json_type.dart';
import 'package:flutter_app/data/provider/dio.dart';
import 'package:flutter_app/domain/model/github_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_api.g.dart';

@riverpod
Future<List<GitHubRepository>> listPublicRepositories(
  ListPublicRepositoriesRef ref,
) async {
  final dio = ref.watch(dioProvider);

  final response = await dio.get<ListJson>('/repositories');
  return response.data?.parseList(GitHubRepository.fromJson) ?? [];
}

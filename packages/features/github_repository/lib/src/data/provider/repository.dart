import 'package:cores_data/network.dart';
import 'package:features_github_repository/src/domain/model/github_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository.g.dart';

@riverpod
Future<List<GitHubRepository>> listPublicRepositories(
  ListPublicRepositoriesRef ref,
) async {
  final dio = ref.watch(dioProvider);

  final response = await dio.get<ListJson>('/repositories');
  return response.data?.parseList(GitHubRepository.fromJson) ?? [];
}

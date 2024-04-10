import 'package:cores_data/network.dart';
import 'package:features_github_repository/src/domain/model/github_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository.g.dart';

@riverpod
Future<List<GitHubRepository>> listOrganizationRepositories(
  ListOrganizationRepositoriesRef ref, {
  int page = 1,
  int perPage = 30,
}) async {
  final dio = ref.watch(dioProvider);
  final response = await dio
      .get<ListJson>('/orgs/yumemi-inc/repos?page=$page&per_page=$perPage');
  return response.data?.parseList(GitHubRepository.fromJson) ?? [];
}

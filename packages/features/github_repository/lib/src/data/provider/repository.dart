import 'package:cores_data/network.dart';
import 'package:features_github_repository/src/domain/model/github_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository.g.dart';

@riverpod
Future<GitHubRepositoryResult> listOrganizationRepositories(
  ListOrganizationRepositoriesRef ref, {
  int page = 1,
  int perPage = 30,
}) async {
  final dio = ref.watch(dioProvider);
  final response = await dio.safeRequest(
    request: () => dio
        .get<ListJson>('/orgs/yumemi-inc/repos?page=$page&per_page=$perPage'),
  );
  final items = response.data?.parseList(GitHubRepository.fromJson) ?? [];
  final hasMore =
      response.headers.map['link']?.first.contains('rel="next"') ?? false;
  return GitHubRepositoryResult(
    items: items,
    hasMore: hasMore,
  );
}

class GitHubRepositoryResult {
  const GitHubRepositoryResult({
    required this.items,
    required this.hasMore,
  });
  final List<GitHubRepository> items;
  final bool hasMore;
}

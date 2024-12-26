import 'package:cores_data/network.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:samples_github_repository/src/domain/model/github_repository.dart';

part 'repository.g.dart';

@riverpod
Future<GitHubRepositoryResult> listOrganizationRepositories(
  Ref ref, {
  int page = 1,
  int perPage = 30,
  String org = 'yumemi-inc',
}) async {
  final dio = ref.watch(dioProvider);
  final response = await dio.safeRequest(
    request: () =>
        dio.get<ListJson>('/orgs/$org/repos?page=$page&per_page=$perPage'),
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

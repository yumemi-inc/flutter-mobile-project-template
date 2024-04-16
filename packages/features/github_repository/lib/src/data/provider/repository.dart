import 'package:cores_data/network.dart';
import 'package:features_github_repository/src/domain/model/github_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository.g.dart';

@riverpod
Future<GithubRepositoryResult> listOrganizationRepositories(
  ListOrganizationRepositoriesRef ref, {
  int page = 1,
  int perPage = 30,
  String org = 'yumemi-inc',
}) async {
  final dio = ref.watch(dioProvider);
  final response = await dio.safeRequest(
    request: () =>
        dio.get<ListJson>('/orgs/$org/repos?page=$page&per_page=$perPage'),
  );
  final items = response.data?.parseList(GithubRepository.fromJson) ?? [];
  final hasMore =
      response.headers.map['link']?.first.contains('rel="next"') ?? false;
  return GithubRepositoryResult(
    items: items,
    hasMore: hasMore,
  );
}

class GithubRepositoryResult {
  const GithubRepositoryResult({
    required this.items,
    required this.hasMore,
  });
  final List<GithubRepository> items;
  final bool hasMore;
}

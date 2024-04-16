import 'package:cores_core/pagination.dart';
import 'package:features_github_repository/src/data/provider/repository.dart';
import 'package:features_github_repository/src/domain/model/github_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final pageBasedGithubRepositoryNotifierProvider = AsyncNotifierProvider
    .autoDispose<PageBasedGithubRepositoryNotifier, GithubRepositoryPageState>(
  PageBasedGithubRepositoryNotifier.new,
);

typedef GithubRepositoryPageState = PageBasedPagingData<GitHubRepository>;

class PageBasedGithubRepositoryNotifier
    extends PageBasedPagingAsyncNotifier<GitHubRepository> {
  @override
  Future<GithubRepositoryPageState> build() async {
    final res = await ref.watch(listOrganizationRepositoriesProvider().future);
    ref.keepAlive();
    return GithubRepositoryPageState(
      items: res.items,
      page: 1,
      hasMore: res.hasMore,
    );
  }

  @override
  Future<GithubRepositoryPageState> fetchNext(int page) async {
    final res =
        await ref.read(listOrganizationRepositoriesProvider(page: page).future);
    ref.keepAlive();
    return GithubRepositoryPageState(
      items: res.items,
      page: 1,
      hasMore: res.hasMore,
    );
  }

  @override
  void forceRefresh() {
    ref.invalidate(listOrganizationRepositoriesProvider);
    super.forceRefresh();
  }
}

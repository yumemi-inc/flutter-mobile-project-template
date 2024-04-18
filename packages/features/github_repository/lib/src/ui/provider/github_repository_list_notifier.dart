import 'package:cores_core/pagination.dart';
import 'package:features_github_repository/src/data/provider/repository.dart';
import 'package:features_github_repository/src/domain/model/github_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final pageBasedGitHubRepositoryNotifierProvider = AsyncNotifierProvider
    .autoDispose<PageBasedGitHubRepositoryNotifier, GitHubRepositoryPageState>(
  PageBasedGitHubRepositoryNotifier.new,
);

typedef GitHubRepositoryPageState = PageBasedPagingData<GitHubRepository>;

class PageBasedGitHubRepositoryNotifier
    extends PageBasedPagingAsyncNotifier<GitHubRepository> {
  @override
  Future<PageBasedFetchResult<GitHubRepository>> fetch({
    required int page,
  }) async {
    final res =
        await ref.read(listOrganizationRepositoriesProvider(page: page).future);
    ref.keepAlive();
    return PageBasedFetchResult(
      items: res.items,
      hasMore: res.hasMore,
    );
  }

  @override
  void forceRefresh() {
    ref.invalidate(listOrganizationRepositoriesProvider);
    super.forceRefresh();
  }
}

import 'package:cores_core/pagination.dart';
import 'package:features_github_repository/src/data/provider/repository.dart';
import 'package:features_github_repository/src/domain/model/github_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final pageBasedGithubRepositoryNotifierProvider = AsyncNotifierProvider
    .autoDispose<PageBasedGithubRepositoryNotifier, GithubRepositoryPageState>(
  PageBasedGithubRepositoryNotifier.new,
);

typedef GithubRepositoryPageState = PageBasedPagingData<GithubRepository>;

class PageBasedGithubRepositoryNotifier
    extends PageBasedPagingAsyncNotifier<GithubRepository> {
  @override
  Future<GithubRepositoryPageState> build() async {
    const initialPage = 1;
    return fetch(initialPage);
  }

  @override
  Future<GithubRepositoryPageState> fetch(int page) async {
    final res =
        await ref.read(listOrganizationRepositoriesProvider(page: page).future);
    ref.keepAlive();
    return GithubRepositoryPageState(
      items: res.items,
      currentPage: page,
      hasMore: res.hasMore,
    );
  }

  @override
  void forceRefresh() {
    ref.invalidate(listOrganizationRepositoriesProvider);
    super.forceRefresh();
  }
}

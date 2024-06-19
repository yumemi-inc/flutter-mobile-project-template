import 'package:cores_core/exception.dart';
import 'package:cores_core/ui.dart';
import 'package:cores_designsystem/components.dart';
import 'package:features_github_repository/src/data/provider/scroll_notifier.dart';
import 'package:features_github_repository/src/domain/model/github_repository.dart';
import 'package:features_github_repository/src/ui/provider/github_repository_list_notifier.dart';
import 'package:features_github_repository/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract interface class GitHubRepositoryListPageNavigator {
  void goGitHubRepositoryDetailPage(
    BuildContext context,
    String repositoryName,
    String? description,
  );
}

typedef GitHubRepositoryPagingView = CommonPagingView<
    PageBasedGitHubRepositoryNotifier,
    GitHubRepositoryPageState,
    GitHubRepository>;

class GitHubRepositoryListPage extends HookConsumerWidget {
  const GitHubRepositoryListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final navigator = ref.watch(gitHubRepositoryListPageNavigatorProvider);
    ref.listen(scrollNotifierProvider, (_, __) async {
      if (!context.mounted) {
        return;
      }

      await scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
    return GitHubRepositoryPagingView(
      provider: pageBasedGitHubRepositoryNotifierProvider,
      contentBuilder: (data, endItem) => ListView.builder(
        key: const PageStorageKey('pageBasedView'),
        itemCount: data.items.length + (endItem != null ? 1 : 0),
        controller: scrollController,
        itemBuilder: (context, index) {
          if (endItem != null && index == data.items.length) {
            return endItem;
          }

          return TextListTile(
            onTap: () => navigator.goGitHubRepositoryDetailPage(
              context,
              data.items[index].name,
              data.items[index].description,
            ),
            text: data.items[index].name,
          );
        },
      ),
      onError: ref.read(appExceptionNotifierProvider.notifier).notify,
    );
  }
}

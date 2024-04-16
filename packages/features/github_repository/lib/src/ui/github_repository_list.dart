import 'package:cores_core/exception.dart';
import 'package:cores_core/ui.dart';
import 'package:cores_designsystem/components.dart';
import 'package:cores_navigation/providers.dart';
import 'package:features_github_repository/src/data/provider/scroll_notifier.dart';
import 'package:features_github_repository/src/domain/model/github_repository.dart';
import 'package:features_github_repository/src/ui/provider/github_repository_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef GithubRepositoryPagingView = CommonPagingView<
    PageBasedGithubRepositoryNotifier,
    GithubRepositoryPageState,
    GithubRepository>;

class GithubRepositoryList extends HookConsumerWidget {
  const GithubRepositoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final navigator = ref.watch(homeNavigatorProvider);
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
    return GithubRepositoryPagingView(
      provider: pageBasedGithubRepositoryNotifierProvider,
      contentBuilder: (data, endItem) => ListView.builder(
        key: const PageStorageKey('pageBasedView'),
        itemCount: data.items.length + (endItem != null ? 1 : 0),
        controller: scrollController,
        itemBuilder: (context, index) {
          if (endItem != null && index == data.items.length) {
            return endItem;
          }

          return TextListTile(
            onTap: () => navigator.goGithubRepositoryDetailPage(
              context,
              data.items[index].name,
            ),
            text: data.items[index].name,
          );
        },
      ),
      onError: ref.read(appExceptionNotifierProvider.notifier).notify,
    );
  }
}

import 'package:cores_designsystem/components.dart';
import 'package:cores_navigation/providers.dart';
import 'package:features_github_repository/src/data/provider/repository.dart';
import 'package:features_github_repository/src/data/provider/scroll_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GitHubRepositoryList extends HookConsumerWidget {
  const GitHubRepositoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final repositories = ref.watch(listPublicRepositoriesProvider);
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
    return Center(
      child: repositories.when(
        data: (value) => ListView.builder(
          controller: scrollController,
          itemCount: value.length,
          itemBuilder: (context, index) => TextListTile(
            onTap: () => navigator.goGithubRepositoryDetailPage(
              context,
              value[index].name,
            ),
            text: value[index].name,
          ),
        ),
        error: (error, _) => Text(error.toString()),
        loading: CircularProgressIndicator.new,
      ),
    );
  }
}

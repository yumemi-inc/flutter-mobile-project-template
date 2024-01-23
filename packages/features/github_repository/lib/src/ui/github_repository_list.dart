import 'package:cores_designsystem/components.dart';
import 'package:features_github_repository/src/data/api/provider/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GitHubRepositoryList extends ConsumerWidget {
  const GitHubRepositoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repositories = ref.watch(listPublicRepositoriesProvider);

    return Center(
      child: repositories.when(
        data: (value) => ListView.builder(
          itemCount: value.length,
          itemBuilder: (context, index) => TextListTile(
            text: value[index].name,
          ),
        ),
        error: (error, _) => Text(error.toString()),
        loading: CircularProgressIndicator.new,
      ),
    );
  }
}

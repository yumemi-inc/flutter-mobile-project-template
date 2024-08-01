import 'dart:async';

import 'package:flutter/material.dart';
import 'package:samples_github_repository/ui.dart';

final class GithubRepositoryListPageNavigatorImpl
    implements GitHubRepositoryListPageNavigator {
  const GithubRepositoryListPageNavigatorImpl();

  @override
  void goGitHubRepositoryDetailPage(
    BuildContext context,
    String repositoryName,
    String? description,
  ) {
    unawaited(
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (context) {
            return GitHubRepositoryDetailPage(
              repositoryName: repositoryName,
              description: description,
            );
          },
        ),
      ),
    );
  }
}

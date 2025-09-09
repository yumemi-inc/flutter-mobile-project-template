import 'dart:async';

import 'package:flutter/material.dart';
import 'package:github_app/ui/pages/github_repository_detail_page.dart';

abstract interface class GitHubRepositoryListPageNavigator {
  void goGitHubRepositoryDetailPage(
    BuildContext context,
    String repositoryName,
    String? description,
  );
}

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

import 'package:features_github_repository/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/router/provider/router.dart';

final class GithubRepositoryListNavigatorImpl
    implements GithubRepositoryListNavigator {
  const GithubRepositoryListNavigatorImpl();

  @override
  void goGitHubRepositoryDetailPage(
    BuildContext context,
    String repositoryName,
    String? description,
  ) {
    GitHubRepositoryDetailPageRoute(repositoryName, description).go(context);
  }
}

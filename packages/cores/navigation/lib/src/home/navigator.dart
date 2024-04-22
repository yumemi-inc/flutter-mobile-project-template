import 'package:flutter/material.dart';

abstract interface class HomeNavigator {
  void goDebugPage(BuildContext context);
  void goWebPage(BuildContext context);
  void goGitHubRepositoryDetailPage(
    BuildContext context,
    String repositoryName,
  );
}

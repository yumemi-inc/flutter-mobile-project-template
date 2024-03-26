import 'package:cores_navigation/navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/router/routes/home_route.dart';
import 'package:flutter_app/router/routes/main_shell_route.dart';

final class HomeNavigatorImpl implements HomeNavigator {
  const HomeNavigatorImpl();

  @override
  void goDebugModePage(BuildContext context) {
    const DebugModePageRoute().go(context);
  }

  @override
  void goWebView(BuildContext context) {
    const WebViewRoute().go(context);
  }

  @override
  void goGithubRepositoryDetail(BuildContext context, String repositoryName) {
    GithubRepositoryDetailPageRoute(repositoryName).go(context);
  }
}

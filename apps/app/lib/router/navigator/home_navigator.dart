import 'dart:async';

import 'package:cores_navigation/navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/router/provider/router.dart';

final class HomeNavigatorImpl implements HomeNavigator {
  const HomeNavigatorImpl();

  @override
  void goDebugPage(BuildContext context) {
    unawaited(
      const DebugPageRoute().push(context),
    );
  }

  @override
  void goWebPage(BuildContext context) {
    unawaited(
      const WebPageRoute().push(context),
    );
  }

  @override
  void goGithubRepositoryDetailPage(
    BuildContext context,
    String repositoryName,
  ) {
    GithubRepositoryDetailPageRoute(repositoryName).go(context);
  }
}

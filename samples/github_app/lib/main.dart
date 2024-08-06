import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_app/route.dart';
import 'package:samples_github_repository/ui.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [
        gitHubRepositoryListPageNavigatorProvider.overrideWithValue(
          const GithubRepositoryListPageNavigatorImpl(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GitHub Repository'),
        ),
        body: const GitHubRepositoryListPage(),
      ),
    );
  }
}

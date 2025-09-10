import 'package:flutter/material.dart';
import 'package:github_app/ui/pages/github_repository_list_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
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

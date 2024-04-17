import 'package:flutter/material.dart';

class GitHubRepositoryDetailPage extends StatelessWidget {
  const GitHubRepositoryDetailPage({
    required String repositoryName,
    super.key,
  }) : _repositoryName = repositoryName;

  final String _repositoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_repositoryName)),
      body: const SizedBox.shrink(),
    );
  }
}

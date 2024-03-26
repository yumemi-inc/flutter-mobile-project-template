import 'package:flutter/material.dart';

class GithubRepositoryDetailPage extends StatelessWidget {
  const GithubRepositoryDetailPage({
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

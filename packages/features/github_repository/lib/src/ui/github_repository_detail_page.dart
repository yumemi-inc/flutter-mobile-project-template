import 'package:flutter/material.dart';

class GitHubRepositoryDetailPage extends StatelessWidget {
  const GitHubRepositoryDetailPage({
    required String repositoryName,
    required String? description,
    super.key,
  })  : _repositoryName = repositoryName,
        _description = description;

  final String _repositoryName;
  final String? _description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_repositoryName)),
      body: Text(_description ?? 'No Description'),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/data/provider/api/repository_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
      const ProviderScope(
          child: MainApp(),
      ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repositories = ref.watch(listPublicRepositoriesProvider);

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: repositories.when(
              data: (value) => ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(value[index].name),
                ),
              ),
              error: (error, _) => Text(error.toString()),
              loading: CircularProgressIndicator.new,
          ),
        ),
      ),
    );
  }
}

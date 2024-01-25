import 'dart:async';

import 'package:features_debug_mode/src/data/api/provider/exception_generator_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DebugModePage extends ConsumerWidget {
  const DebugModePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug Mode'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                unawaited(
                  ref.read(exceptionGeneratorApiProvider.notifier).request(),
                );
              },
              child: const Text('Show error SnackBar'),
            ),
          ],
        ),
      ),
    );
  }
}

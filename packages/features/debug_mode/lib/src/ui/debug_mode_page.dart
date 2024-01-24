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
            _FixSizedElevatedButton(
              title: 'Show error SnackBar',
              onPressed: () async {
                unawaited(
                  ref.read(exceptionGeneratorApiProvider.notifier).request(),
                );
              },
            ),
            _FixSizedElevatedButton(
              title: 'Enable maintenance mode',
              onPressed: () async {
                // TODO: Enable maintenance mode
              },
            ),
            _FixSizedElevatedButton(
              title: 'Enable force update',
              onPressed: () async {
                // TODO: Enable force update
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _FixSizedElevatedButton extends StatelessWidget {
  const _FixSizedElevatedButton({
    required String title,
    required VoidCallback onPressed,
  })  : _title = title,
        _onPressed = onPressed;

  final String _title;
  final VoidCallback _onPressed;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: ElevatedButton(
        onPressed: _onPressed,
        child: Text(_title),
      ),
    );
  }
}

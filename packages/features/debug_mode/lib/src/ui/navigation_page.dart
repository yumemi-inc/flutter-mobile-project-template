import 'package:cores_navigation/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationPage extends ConsumerWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigator = ref.watch(debugNavigatorProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('画面遷移ページ'),
      ),
      body: Center(
        child: Column(
          children: [
            _FixSizedElevatedButton(
              title: '画面A',
              onPressed: () => navigator.goPageA(context),
            ),
            _FixSizedElevatedButton(
              title: '画面B',
              onPressed: () => navigator.goPageB(context),
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

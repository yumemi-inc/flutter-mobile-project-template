import 'package:cores_navigation/providers.dart';
import 'package:features_debug_mode/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationPage extends ConsumerWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigator = ref.watch(debugNavigatorProvider);
    final l10n = L10nDebug.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.navigationPageAppBar),
      ),
      body: Center(
        child: Column(
          children: [
            _FixSizedElevatedButton(
              title: l10n.pageA,
              onPressed: () => navigator.goPageA(context),
            ),
            _FixSizedElevatedButton(
              title: l10n.pageB,
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

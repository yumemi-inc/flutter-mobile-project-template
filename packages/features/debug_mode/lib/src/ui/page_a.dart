import 'package:features_debug_mode/l10n.dart';
import 'package:flutter/material.dart';

class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = L10nDebug.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.pageA),
      ),
    );
  }
}

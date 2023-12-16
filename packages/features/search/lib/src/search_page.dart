import 'package:flutter/material.dart';
import 'package:search/src/gen/l10n/l10n.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = L10n.of(context);
    return Scaffold(
      body: Center(
        child: Text(l.search),
      ),
    );
  }
}

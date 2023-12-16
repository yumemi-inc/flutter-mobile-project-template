import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/gen/l10n/l10n.dart';
import 'package:search/l10n.dart' as search_l10n;
import 'package:search/search.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: [
        ...L10n.localizationsDelegates,
        ...search_l10n.L10n.localizationsDelegates,
      ],
      supportedLocales: [
        ...L10n.supportedLocales,
        ...search_l10n.L10n.supportedLocales,
      ],
      home: HelloPage(),
    );
  }
}

class HelloPage extends StatelessWidget {
  const HelloPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = L10n.of(context);
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(l.hello),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () async {
                unawaited(
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const SearchPage(); // 遷移先の画面widgetを指定
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

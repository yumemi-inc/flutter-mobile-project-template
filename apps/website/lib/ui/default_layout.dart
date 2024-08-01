import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:website/hooks/use_markdown_doc_keys.dart';
import 'package:website/router/router.dart';

class DefaultLayout extends HookWidget {
  const DefaultLayout({
    required Widget child,
    super.key,
  }) : _navigator = child;

  final Widget _navigator;

  @override
  Widget build(BuildContext context) {
    final docKeys = useMarkdownDocKeys();

    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 200,
            child: ListView(
              children: [
                ...docKeys.map(
                  (key) => ListTile(
                    title: Text(key),
                    onTap: () {
                      MarkdownPageRoute(key: key).go(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _navigator,
          ),
        ],
      ),
    );
  }
}

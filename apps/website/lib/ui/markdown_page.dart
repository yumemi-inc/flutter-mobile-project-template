import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:website/hooks/use_markdown_doc.dart';

class MarkdownPage extends HookWidget {
  const MarkdownPage({
    required String? docKey,
    super.key,
  }) : _docKey = docKey;

  final String? _docKey;

  @override
  Widget build(BuildContext context) {
    final doc = useMarkdownDoc(_docKey);

    if (doc == null) {
      return const SizedBox.shrink();
    }

    return Markdown(
      data: doc,
      selectable: true,
      onTapLink: (text, href, title) {
        if (href == null) {
          return;
        }

        // TODO: URLをみて、内部リンクの対応

        js.context.callMethod('open', [href]);
      },
    );
  }
}

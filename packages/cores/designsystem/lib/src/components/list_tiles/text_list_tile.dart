import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// example component
class TextListTile extends StatelessWidget {
  const TextListTile({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('text', text, defaultValue: ''));
  }
}

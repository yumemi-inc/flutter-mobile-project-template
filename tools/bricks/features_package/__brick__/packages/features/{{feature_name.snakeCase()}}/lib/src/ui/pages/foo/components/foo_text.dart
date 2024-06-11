import 'package:features_{{feature_name.snakeCase()}}/src/gen/l10n/l10n.dart';
import 'package:flutter/material.dart';

final class FooText extends StatelessWidget {
  const FooText({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    return Text(l10n.{{feature_name.camelCase()}}FooText);
  }
}

import 'package:features_{{feature_name.snakeCase()}}/src/gen/l10n/l10n.dart';
import 'package:features_{{feature_name.snakeCase()}}/src/ui/components/{{feature_name.snakeCase()}}_text.dart';
import 'package:features_{{feature_name.snakeCase()}}/src/ui/pages/detail/components/{{feature_name.snakeCase()}}_detail_text.dart';
import 'package:flutter/material.dart';

class {{feature_name.pascalCase()}}DetailPage extends StatelessWidget {
  const {{feature_name.pascalCase()}}DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.{{feature_name.camelCase()}}DetailAppBarTitle),
      ),
      body: const SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              {{feature_name.pascalCase()}}Text(),
              {{feature_name.pascalCase()}}DetailText(),
            ],
          ),
        ),
      ),
    );
  }
}

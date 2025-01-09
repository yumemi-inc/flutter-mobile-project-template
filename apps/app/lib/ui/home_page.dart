import 'package:cores_designsystem/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/gen/l10n/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_page.g.dart';

abstract interface class HomePageNavigator {
  void goWebPage(BuildContext context);
}

@Riverpod(dependencies: [])
HomePageNavigator homePageNavigator(Ref ref) => throw UnimplementedError();

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = L10n.of(context);
    final navigator = ref.watch(homePageNavigatorProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(l.appBar),
        actions: [
          IconButton(
            onPressed: () => navigator.goWebPage(context),
            icon: const Icon(
              Icons.web,
            ),
          ),
        ],
        iconTheme: IconTheme.of(context).copyWith(
          color: context.appColors.icon,
        ),
      ),
      body: Center(
        child: Text(l.home),
      ),
    );
  }
}

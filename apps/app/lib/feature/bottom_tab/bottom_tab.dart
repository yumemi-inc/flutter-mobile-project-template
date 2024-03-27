import 'package:features_github_repository/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MainPage extends ConsumerWidget {
  const MainPage({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          NavigationDestination(
            label: 'Settings',
            icon: Icon(Icons.settings),
          ),
        ],
        onDestinationSelected: (index) async {
          final canPop = GoRouter.of(context).canPop();
          if (navigationShell.currentIndex == index && !canPop) {
            ref.read(scrollNotifierProvider.notifier).notifyScrollToTop();
          } else {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          }
        },
      ),
    );
  }
}

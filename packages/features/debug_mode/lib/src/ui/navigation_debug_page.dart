import 'package:flutter/material.dart';

class NavigationDebugPage extends StatelessWidget {
  const NavigationDebugPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('画面遷移一覧'),
      ),
    );
  }
}

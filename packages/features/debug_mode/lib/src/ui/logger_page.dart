import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'logger_page.g.dart';

abstract interface class LoggerPageNavigator {
  void goLoggerPage(BuildContext context);
}

@riverpod
Talker logger(Ref ref) => throw UnimplementedError();

class LoggerPage extends ConsumerWidget {
  const LoggerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final talker = ref.watch(loggerProvider);

    return Scaffold(
      body: TalkerScreen(talker: talker),
    );
  }
}

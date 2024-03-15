import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scroll_controller.g.dart';

@riverpod
// ignore:unsupported_provider_value
ScrollController scrollController(ScrollControllerRef ref) {
  final scrollController = ScrollController();
  ref.onDispose(scrollController.dispose);
  return scrollController;
}

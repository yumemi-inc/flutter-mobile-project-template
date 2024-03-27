import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scroll_notifier.g.dart';

@riverpod
class ScrollNotifier extends _$ScrollNotifier {
  @override
  void build() {}

  void notifyScrollToTop() => ref.notifyListeners();
}

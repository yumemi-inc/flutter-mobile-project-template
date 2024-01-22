import 'package:flutter_app/core/app_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_exception_notifier_provider.g.dart';

@riverpod
class AppExceptionNotifier extends _$AppExceptionNotifier {
  @override
  AppException? build() {
    return null;
  }

  void notify(AppException exception) {
    state = exception;
  }

  void consume() {
    state = null;
  }
}

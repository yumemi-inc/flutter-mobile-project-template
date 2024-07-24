import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AsyncValueExtension<T> on AsyncValue<T> {
  /// Executes a future and returns its result as an [AsyncValue.data]. Captures
  /// exceptions, preserving the previous state as [AsyncValue.error].
  Future<AsyncValue<T>> guardPreservingPreviousOnError(
    Future<T> Function() future,
  ) async {
    try {
      return AsyncValue.data(await future());
    } on Exception catch (err, stack) {
      return AsyncValue<T>.error(err, stack).copyWithPrevious(this);
    }
  }

  /// Extends the [when] method to handle async data states more effectively,
  /// especially when maintaining data integrity despite errors.
  ///
  /// Use `skipErrorOnHasValue` to retain and display existing data
  /// even if subsequent fetch attempts result in errors,
  /// ideal for maintaining a seamless user experience.
  R whenIgnorableError<R>({
    required R Function(
      T data, {
      required bool hasError,
      required bool isLoading,
    }) data,
    required R Function(Object error, StackTrace stackTrace) error,
    required R Function() loading,
    bool skipLoadingOnReload = false,
    bool skipLoadingOnRefresh = true,
    bool skipError = false,
    bool skipErrorOnHasValue = false,
  }) {
    if (skipErrorOnHasValue) {
      if (hasValue && hasError) {
        return data(requireValue, hasError: true, isLoading: isLoading);
      }
    }

    return when(
      skipLoadingOnReload: skipLoadingOnReload,
      skipLoadingOnRefresh: skipLoadingOnRefresh,
      skipError: skipError,
      data: (d) => data(d, hasError: hasError, isLoading: isLoading),
      error: error,
      loading: loading,
    );
  }
}

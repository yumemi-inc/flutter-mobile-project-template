import 'package:cores_core/exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provides error handling for futures within [AsyncValue].
///
/// Executes a future and returns its result as an [AsyncValue.data]. Captures
/// exceptions as [AsyncValue.error], preserving the previous state.
extension AsyncValueErrorHandling<T> on AsyncValue<T> {
  Future<AsyncValue<T>> guardPlus(Future<T> Function() future) async {
    try {
      return AsyncValue.data(await future());
    } on AppException catch (err, stack) {
      return AsyncValue<T>.error(err, stack).copyWithPrevious(this);
    }
  }

  /// Extends [when] for advanced async data states handling.
  ///
  /// Use `skipErrorOnHasValue` to ignore errors when data already exists,
  /// useful for displaying existing data despite subsequent fetch errors.
  R whenPlus<R>({
    required R Function(T data, {required bool hasError}) data,
    required R Function(Object error, StackTrace stackTrace) error,
    required R Function() loading,
    bool skipLoadingOnReload = false,
    bool skipLoadingOnRefresh = true,
    bool skipError = false,
    bool skipErrorOnHasValue = false,
  }) {
    if (skipErrorOnHasValue) {
      if (hasValue && hasError) {
        return data(requireValue, hasError: true);
      }
    }

    return when(
      skipLoadingOnReload: skipLoadingOnReload,
      skipLoadingOnRefresh: skipLoadingOnRefresh,
      skipError: skipError,
      data: (d) => data(d, hasError: hasError),
      error: error,
      loading: loading,
    );
  }
}

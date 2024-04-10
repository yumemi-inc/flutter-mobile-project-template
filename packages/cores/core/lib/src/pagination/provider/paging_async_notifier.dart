import 'package:cores_core/src/pagination/model/paging_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// An abstract notifier for paging logic, handling asynchronous data fetching
/// and state management.
///
/// T: The type of paging data being managed.
/// U: The type of the items within the paging data.
/// V: The type of the identifier for items within the paging data.
abstract class PagingAsyncNotifier<T extends PagingData<U, V>,
    U extends PagingDataItem<V>, V> extends AutoDisposeAsyncNotifier<T> {
  Future<void> loadNext();

  void forceRefresh() {
    state = AsyncLoading<T>();
    ref.invalidateSelf();
  }
}

/// Extends [PagingAsyncNotifier] to implement page-based data fetching logic.
///
/// Automatically handles fetching and appending data for subsequent pages.
/// Typically, only [fetchNext] needs to be overridden to define fetching logic
/// for the next page.
///
/// T: The type of items in the paging data.
/// U: The type of the identifier for items, typically an `int` or `String`.
abstract class PageBasedPagingAsyncNotifier<T extends PagingDataItem<U>, U>
    extends PagingAsyncNotifier<PageBasedPagingData<T, U>, T, U> {
  Future<PageBasedPagingData<T, U>> fetchNext(int page);

  @override
  Future<void> loadNext() async {
    final value = state.valueOrNull;
    if (value == null || state.hasError) {
      return;
    }

    if (value.hasMore) {
      state = AsyncLoading<PageBasedPagingData<T, U>>().copyWithPrevious(state);

      state = await state.guardPlus(
        () async {
          final next = await fetchNext(value.page + 1);

          return value.copyWith(
            items: [...value.items, ...next.items],
            page: value.page + 1,
            hasMore: next.hasMore,
          );
        },
      );
    }
  }
}

/// Provides error handling for futures within [AsyncValue].
///
/// Executes a future and returns its result as an [AsyncValue.data]. Captures
/// exceptions as [AsyncValue.error], preserving the previous state.
extension AsyncValueErrorHandling<T> on AsyncValue<T> {
  Future<AsyncValue<T>> guardPlus(Future<T> Function() future) async {
    try {
      return AsyncValue.data(await future());
    } on Exception catch (err, stack) {
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

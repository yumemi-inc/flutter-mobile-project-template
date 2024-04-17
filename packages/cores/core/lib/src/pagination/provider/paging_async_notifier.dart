import 'dart:async';

import 'package:cores_core/extension.dart';
import 'package:cores_core/src/pagination/model/paging_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// An abstract notifier for paging logic, handling asynchronous data fetching
/// and state management.
///
/// T: The type of the paginated data structure being managed.
/// U: The type of the items within the paginated data.
abstract class PagingAsyncNotifier<T extends PagingData<U>, U>
    extends AutoDisposeAsyncNotifier<T> {
  Future<void> loadNext();

  void forceRefresh() {
    state = AsyncLoading<T>();
    ref.invalidateSelf();
  }
}

/// Extends [PagingAsyncNotifier] to implement page-based data fetching logic.
///
/// Automatically handles fetching and appending data for subsequent pages.
/// Typically, only [fetch] needs to be overridden to define fetching logic
/// for the next page.
///
/// T: The type of items in the paging data.
abstract class PageBasedPagingAsyncNotifier<T>
    extends PagingAsyncNotifier<PageBasedPagingData<T>, T> {
  Future<PageBasedFetchResult<T>> fetch({int page = 1});

  @override
  FutureOr<PageBasedPagingData<T>> build() async {
    final res = await fetch();
    return PageBasedPagingData(
      items: res.items,
      currentPage: 1,
      hasMore: res.hasMore,
    );
  }

  @override
  Future<void> loadNext() async {
    final value = state.valueOrNull;
    if (value == null || state.hasError) {
      return;
    }

    if (value.hasMore) {
      state = AsyncLoading<PageBasedPagingData<T>>().copyWithPrevious(state);

      state = await state.guardPreservingPreviousOnError(
        () async {
          final next = await fetch(page: value.currentPage + 1);

          return value.copyWith(
            items: [...value.items, ...next.items],
            currentPage: value.currentPage + 1,
            hasMore: next.hasMore,
          );
        },
      );
    }
  }
}

class PageBasedFetchResult<T> {
  const PageBasedFetchResult({
    required this.items,
    required this.hasMore,
  });

  final List<T> items;
  final bool hasMore;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'paging_data.freezed.dart';

/// A basic interface ensuring an item has an identifier.
abstract class PagingDataItem<T> {
  T get id;
}

/// Interface for a dataset capable of pagination.
/// Contains a list of items in [items] and a flag [hasMore]
/// indicating if more pages are available.
abstract class PagingData<T extends PagingDataItem<U>, U> {
  List<T> get items;
  bool get hasMore;
}

/// Represents paginated data for a specific page.
/// Manages paginated items and checks for more data availability.
@freezed
class PageBasedPagingData<T extends PagingDataItem<U>, U>
    with _$PageBasedPagingData<T, U>
    implements PagingData<T, U> {
  const factory PageBasedPagingData({
    required List<T> items,
    required int page,
    required bool hasMore,
  }) = _PageBasedPagingData<T, U>;
  const PageBasedPagingData._();
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'paging_data.freezed.dart';

/// Interface for a dataset capable of pagination.
/// Contains a list of items in [items] and a flag [hasMore]
/// indicating if more pages are available.
abstract interface class PagingData<T> {
  List<T> get items;
  bool get hasMore;
}

/// Represents paginated data for a specific page.
/// Manages paginated items and checks for more data availability.
@freezed
class PageBasedPagingData<T>
    with _$PageBasedPagingData<T>
    implements PagingData<T> {
  const factory PageBasedPagingData({
    required List<T> items,
    required int currentPage,
    required bool hasMore,
  }) = _PageBasedPagingData<T>;
  const PageBasedPagingData._();
}

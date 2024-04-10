// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paging_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PageBasedPagingData<T extends PagingDataItem<U>, U> {
  List<T> get items => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PageBasedPagingDataCopyWith<T, U, PageBasedPagingData<T, U>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageBasedPagingDataCopyWith<T extends PagingDataItem<U>, U,
    $Res> {
  factory $PageBasedPagingDataCopyWith(PageBasedPagingData<T, U> value,
          $Res Function(PageBasedPagingData<T, U>) then) =
      _$PageBasedPagingDataCopyWithImpl<T, U, $Res, PageBasedPagingData<T, U>>;
  @useResult
  $Res call({List<T> items, int page, bool hasMore});
}

/// @nodoc
class _$PageBasedPagingDataCopyWithImpl<T extends PagingDataItem<U>, U, $Res,
        $Val extends PageBasedPagingData<T, U>>
    implements $PageBasedPagingDataCopyWith<T, U, $Res> {
  _$PageBasedPagingDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? hasMore = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageBasedPagingDataImplCopyWith<T extends PagingDataItem<U>,
    U, $Res> implements $PageBasedPagingDataCopyWith<T, U, $Res> {
  factory _$$PageBasedPagingDataImplCopyWith(
          _$PageBasedPagingDataImpl<T, U> value,
          $Res Function(_$PageBasedPagingDataImpl<T, U>) then) =
      __$$PageBasedPagingDataImplCopyWithImpl<T, U, $Res>;
  @override
  @useResult
  $Res call({List<T> items, int page, bool hasMore});
}

/// @nodoc
class __$$PageBasedPagingDataImplCopyWithImpl<T extends PagingDataItem<U>, U,
        $Res>
    extends _$PageBasedPagingDataCopyWithImpl<T, U, $Res,
        _$PageBasedPagingDataImpl<T, U>>
    implements _$$PageBasedPagingDataImplCopyWith<T, U, $Res> {
  __$$PageBasedPagingDataImplCopyWithImpl(
      _$PageBasedPagingDataImpl<T, U> _value,
      $Res Function(_$PageBasedPagingDataImpl<T, U>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? hasMore = null,
  }) {
    return _then(_$PageBasedPagingDataImpl<T, U>(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PageBasedPagingDataImpl<T extends PagingDataItem<U>, U>
    extends _PageBasedPagingData<T, U> {
  const _$PageBasedPagingDataImpl(
      {required final List<T> items, required this.page, required this.hasMore})
      : _items = items,
        super._();

  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int page;
  @override
  final bool hasMore;

  @override
  String toString() {
    return 'PageBasedPagingData<$T, $U>(items: $items, page: $page, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageBasedPagingDataImpl<T, U> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), page, hasMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PageBasedPagingDataImplCopyWith<T, U, _$PageBasedPagingDataImpl<T, U>>
      get copyWith => __$$PageBasedPagingDataImplCopyWithImpl<T, U,
          _$PageBasedPagingDataImpl<T, U>>(this, _$identity);
}

abstract class _PageBasedPagingData<T extends PagingDataItem<U>, U>
    extends PageBasedPagingData<T, U> {
  const factory _PageBasedPagingData(
      {required final List<T> items,
      required final int page,
      required final bool hasMore}) = _$PageBasedPagingDataImpl<T, U>;
  const _PageBasedPagingData._() : super._();

  @override
  List<T> get items;
  @override
  int get page;
  @override
  bool get hasMore;
  @override
  @JsonKey(ignore: true)
  _$$PageBasedPagingDataImplCopyWith<T, U, _$PageBasedPagingDataImpl<T, U>>
      get copyWith => throw _privateConstructorUsedError;
}

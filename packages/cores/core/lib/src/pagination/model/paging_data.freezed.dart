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
mixin _$PageBasedPagingData<T> {
  List<T> get items => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;

  /// Create a copy of PageBasedPagingData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PageBasedPagingDataCopyWith<T, PageBasedPagingData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageBasedPagingDataCopyWith<T, $Res> {
  factory $PageBasedPagingDataCopyWith(PageBasedPagingData<T> value,
          $Res Function(PageBasedPagingData<T>) then) =
      _$PageBasedPagingDataCopyWithImpl<T, $Res, PageBasedPagingData<T>>;
  @useResult
  $Res call({List<T> items, int currentPage, bool hasMore});
}

/// @nodoc
class _$PageBasedPagingDataCopyWithImpl<T, $Res,
        $Val extends PageBasedPagingData<T>>
    implements $PageBasedPagingDataCopyWith<T, $Res> {
  _$PageBasedPagingDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PageBasedPagingData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? currentPage = null,
    Object? hasMore = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageBasedPagingDataImplCopyWith<T, $Res>
    implements $PageBasedPagingDataCopyWith<T, $Res> {
  factory _$$PageBasedPagingDataImplCopyWith(_$PageBasedPagingDataImpl<T> value,
          $Res Function(_$PageBasedPagingDataImpl<T>) then) =
      __$$PageBasedPagingDataImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({List<T> items, int currentPage, bool hasMore});
}

/// @nodoc
class __$$PageBasedPagingDataImplCopyWithImpl<T, $Res>
    extends _$PageBasedPagingDataCopyWithImpl<T, $Res,
        _$PageBasedPagingDataImpl<T>>
    implements _$$PageBasedPagingDataImplCopyWith<T, $Res> {
  __$$PageBasedPagingDataImplCopyWithImpl(_$PageBasedPagingDataImpl<T> _value,
      $Res Function(_$PageBasedPagingDataImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of PageBasedPagingData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? currentPage = null,
    Object? hasMore = null,
  }) {
    return _then(_$PageBasedPagingDataImpl<T>(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PageBasedPagingDataImpl<T> extends _PageBasedPagingData<T> {
  const _$PageBasedPagingDataImpl(
      {required final List<T> items,
      required this.currentPage,
      required this.hasMore})
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
  final int currentPage;
  @override
  final bool hasMore;

  @override
  String toString() {
    return 'PageBasedPagingData<$T>(items: $items, currentPage: $currentPage, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageBasedPagingDataImpl<T> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), currentPage, hasMore);

  /// Create a copy of PageBasedPagingData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PageBasedPagingDataImplCopyWith<T, _$PageBasedPagingDataImpl<T>>
      get copyWith => __$$PageBasedPagingDataImplCopyWithImpl<T,
          _$PageBasedPagingDataImpl<T>>(this, _$identity);
}

abstract class _PageBasedPagingData<T> extends PageBasedPagingData<T> {
  const factory _PageBasedPagingData(
      {required final List<T> items,
      required final int currentPage,
      required final bool hasMore}) = _$PageBasedPagingDataImpl<T>;
  const _PageBasedPagingData._() : super._();

  @override
  List<T> get items;
  @override
  int get currentPage;
  @override
  bool get hasMore;

  /// Create a copy of PageBasedPagingData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PageBasedPagingDataImplCopyWith<T, _$PageBasedPagingDataImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

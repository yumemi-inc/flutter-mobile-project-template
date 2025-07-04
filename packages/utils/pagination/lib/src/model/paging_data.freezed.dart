// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paging_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PageBasedPagingData<T> {

 List<T> get items; int get currentPage; bool get hasMore;
/// Create a copy of PageBasedPagingData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageBasedPagingDataCopyWith<T, PageBasedPagingData<T>> get copyWith => _$PageBasedPagingDataCopyWithImpl<T, PageBasedPagingData<T>>(this as PageBasedPagingData<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageBasedPagingData<T>&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),currentPage,hasMore);

@override
String toString() {
  return 'PageBasedPagingData<$T>(items: $items, currentPage: $currentPage, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $PageBasedPagingDataCopyWith<T,$Res>  {
  factory $PageBasedPagingDataCopyWith(PageBasedPagingData<T> value, $Res Function(PageBasedPagingData<T>) _then) = _$PageBasedPagingDataCopyWithImpl;
@useResult
$Res call({
 List<T> items, int currentPage, bool hasMore
});




}
/// @nodoc
class _$PageBasedPagingDataCopyWithImpl<T,$Res>
    implements $PageBasedPagingDataCopyWith<T, $Res> {
  _$PageBasedPagingDataCopyWithImpl(this._self, this._then);

  final PageBasedPagingData<T> _self;
  final $Res Function(PageBasedPagingData<T>) _then;

/// Create a copy of PageBasedPagingData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? currentPage = null,Object? hasMore = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<T>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _PageBasedPagingData<T> extends PageBasedPagingData<T> {
  const _PageBasedPagingData({required final  List<T> items, required this.currentPage, required this.hasMore}): _items = items,super._();
  

 final  List<T> _items;
@override List<T> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int currentPage;
@override final  bool hasMore;

/// Create a copy of PageBasedPagingData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageBasedPagingDataCopyWith<T, _PageBasedPagingData<T>> get copyWith => __$PageBasedPagingDataCopyWithImpl<T, _PageBasedPagingData<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PageBasedPagingData<T>&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),currentPage,hasMore);

@override
String toString() {
  return 'PageBasedPagingData<$T>(items: $items, currentPage: $currentPage, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$PageBasedPagingDataCopyWith<T,$Res> implements $PageBasedPagingDataCopyWith<T, $Res> {
  factory _$PageBasedPagingDataCopyWith(_PageBasedPagingData<T> value, $Res Function(_PageBasedPagingData<T>) _then) = __$PageBasedPagingDataCopyWithImpl;
@override @useResult
$Res call({
 List<T> items, int currentPage, bool hasMore
});




}
/// @nodoc
class __$PageBasedPagingDataCopyWithImpl<T,$Res>
    implements _$PageBasedPagingDataCopyWith<T, $Res> {
  __$PageBasedPagingDataCopyWithImpl(this._self, this._then);

  final _PageBasedPagingData<T> _self;
  final $Res Function(_PageBasedPagingData<T>) _then;

/// Create a copy of PageBasedPagingData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? currentPage = null,Object? hasMore = null,}) {
  return _then(_PageBasedPagingData<T>(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<T>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

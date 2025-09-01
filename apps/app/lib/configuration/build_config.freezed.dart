// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'build_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BuildConfig {

 String get appName; String get packageName; String get version; String get buildNumber; String get buildSignature; Flavor get flavor; String? get installerStore;
/// Create a copy of BuildConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuildConfigCopyWith<BuildConfig> get copyWith => _$BuildConfigCopyWithImpl<BuildConfig>(this as BuildConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BuildConfig&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.version, version) || other.version == version)&&(identical(other.buildNumber, buildNumber) || other.buildNumber == buildNumber)&&(identical(other.buildSignature, buildSignature) || other.buildSignature == buildSignature)&&(identical(other.flavor, flavor) || other.flavor == flavor)&&(identical(other.installerStore, installerStore) || other.installerStore == installerStore));
}


@override
int get hashCode => Object.hash(runtimeType,appName,packageName,version,buildNumber,buildSignature,flavor,installerStore);

@override
String toString() {
  return 'BuildConfig(appName: $appName, packageName: $packageName, version: $version, buildNumber: $buildNumber, buildSignature: $buildSignature, flavor: $flavor, installerStore: $installerStore)';
}


}

/// @nodoc
abstract mixin class $BuildConfigCopyWith<$Res>  {
  factory $BuildConfigCopyWith(BuildConfig value, $Res Function(BuildConfig) _then) = _$BuildConfigCopyWithImpl;
@useResult
$Res call({
 String appName, String packageName, String version, String buildNumber, String buildSignature, Flavor flavor, String? installerStore
});




}
/// @nodoc
class _$BuildConfigCopyWithImpl<$Res>
    implements $BuildConfigCopyWith<$Res> {
  _$BuildConfigCopyWithImpl(this._self, this._then);

  final BuildConfig _self;
  final $Res Function(BuildConfig) _then;

/// Create a copy of BuildConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appName = null,Object? packageName = null,Object? version = null,Object? buildNumber = null,Object? buildSignature = null,Object? flavor = null,Object? installerStore = freezed,}) {
  return _then(_self.copyWith(
appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,buildNumber: null == buildNumber ? _self.buildNumber : buildNumber // ignore: cast_nullable_to_non_nullable
as String,buildSignature: null == buildSignature ? _self.buildSignature : buildSignature // ignore: cast_nullable_to_non_nullable
as String,flavor: null == flavor ? _self.flavor : flavor // ignore: cast_nullable_to_non_nullable
as Flavor,installerStore: freezed == installerStore ? _self.installerStore : installerStore // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BuildConfig].
extension BuildConfigPatterns on BuildConfig {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _BuildConfig value)?  _init,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BuildConfig() when _init != null:
return _init(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _BuildConfig value)  _init,}){
final _that = this;
switch (_that) {
case _BuildConfig():
return _init(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _BuildConfig value)?  _init,}){
final _that = this;
switch (_that) {
case _BuildConfig() when _init != null:
return _init(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String appName,  String packageName,  String version,  String buildNumber,  String buildSignature,  Flavor flavor,  String? installerStore)?  _init,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BuildConfig() when _init != null:
return _init(_that.appName,_that.packageName,_that.version,_that.buildNumber,_that.buildSignature,_that.flavor,_that.installerStore);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String appName,  String packageName,  String version,  String buildNumber,  String buildSignature,  Flavor flavor,  String? installerStore)  _init,}) {final _that = this;
switch (_that) {
case _BuildConfig():
return _init(_that.appName,_that.packageName,_that.version,_that.buildNumber,_that.buildSignature,_that.flavor,_that.installerStore);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String appName,  String packageName,  String version,  String buildNumber,  String buildSignature,  Flavor flavor,  String? installerStore)?  _init,}) {final _that = this;
switch (_that) {
case _BuildConfig() when _init != null:
return _init(_that.appName,_that.packageName,_that.version,_that.buildNumber,_that.buildSignature,_that.flavor,_that.installerStore);case _:
  return null;

}
}

}

/// @nodoc


class _BuildConfig extends BuildConfig {
  const _BuildConfig({required this.appName, required this.packageName, required this.version, required this.buildNumber, required this.buildSignature, required this.flavor, required this.installerStore}): super._();
  

@override final  String appName;
@override final  String packageName;
@override final  String version;
@override final  String buildNumber;
@override final  String buildSignature;
@override final  Flavor flavor;
@override final  String? installerStore;

/// Create a copy of BuildConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BuildConfigCopyWith<_BuildConfig> get copyWith => __$BuildConfigCopyWithImpl<_BuildConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BuildConfig&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.version, version) || other.version == version)&&(identical(other.buildNumber, buildNumber) || other.buildNumber == buildNumber)&&(identical(other.buildSignature, buildSignature) || other.buildSignature == buildSignature)&&(identical(other.flavor, flavor) || other.flavor == flavor)&&(identical(other.installerStore, installerStore) || other.installerStore == installerStore));
}


@override
int get hashCode => Object.hash(runtimeType,appName,packageName,version,buildNumber,buildSignature,flavor,installerStore);

@override
String toString() {
  return 'BuildConfig._init(appName: $appName, packageName: $packageName, version: $version, buildNumber: $buildNumber, buildSignature: $buildSignature, flavor: $flavor, installerStore: $installerStore)';
}


}

/// @nodoc
abstract mixin class _$BuildConfigCopyWith<$Res> implements $BuildConfigCopyWith<$Res> {
  factory _$BuildConfigCopyWith(_BuildConfig value, $Res Function(_BuildConfig) _then) = __$BuildConfigCopyWithImpl;
@override @useResult
$Res call({
 String appName, String packageName, String version, String buildNumber, String buildSignature, Flavor flavor, String? installerStore
});




}
/// @nodoc
class __$BuildConfigCopyWithImpl<$Res>
    implements _$BuildConfigCopyWith<$Res> {
  __$BuildConfigCopyWithImpl(this._self, this._then);

  final _BuildConfig _self;
  final $Res Function(_BuildConfig) _then;

/// Create a copy of BuildConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appName = null,Object? packageName = null,Object? version = null,Object? buildNumber = null,Object? buildSignature = null,Object? flavor = null,Object? installerStore = freezed,}) {
  return _then(_BuildConfig(
appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,buildNumber: null == buildNumber ? _self.buildNumber : buildNumber // ignore: cast_nullable_to_non_nullable
as String,buildSignature: null == buildSignature ? _self.buildSignature : buildSignature // ignore: cast_nullable_to_non_nullable
as String,flavor: null == flavor ? _self.flavor : flavor // ignore: cast_nullable_to_non_nullable
as Flavor,installerStore: freezed == installerStore ? _self.installerStore : installerStore // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'force_update_target_version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForceUpdateTargetVersion implements DiagnosticableTreeMixin {

 Version get ios; Version get android;
/// Create a copy of ForceUpdateTargetVersion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForceUpdateTargetVersionCopyWith<ForceUpdateTargetVersion> get copyWith => _$ForceUpdateTargetVersionCopyWithImpl<ForceUpdateTargetVersion>(this as ForceUpdateTargetVersion, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ForceUpdateTargetVersion'))
    ..add(DiagnosticsProperty('ios', ios))..add(DiagnosticsProperty('android', android));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForceUpdateTargetVersion&&(identical(other.ios, ios) || other.ios == ios)&&(identical(other.android, android) || other.android == android));
}


@override
int get hashCode => Object.hash(runtimeType,ios,android);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ForceUpdateTargetVersion(ios: $ios, android: $android)';
}


}

/// @nodoc
abstract mixin class $ForceUpdateTargetVersionCopyWith<$Res>  {
  factory $ForceUpdateTargetVersionCopyWith(ForceUpdateTargetVersion value, $Res Function(ForceUpdateTargetVersion) _then) = _$ForceUpdateTargetVersionCopyWithImpl;
@useResult
$Res call({
 Version ios, Version android
});




}
/// @nodoc
class _$ForceUpdateTargetVersionCopyWithImpl<$Res>
    implements $ForceUpdateTargetVersionCopyWith<$Res> {
  _$ForceUpdateTargetVersionCopyWithImpl(this._self, this._then);

  final ForceUpdateTargetVersion _self;
  final $Res Function(ForceUpdateTargetVersion) _then;

/// Create a copy of ForceUpdateTargetVersion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ios = null,Object? android = null,}) {
  return _then(_self.copyWith(
ios: null == ios ? _self.ios : ios // ignore: cast_nullable_to_non_nullable
as Version,android: null == android ? _self.android : android // ignore: cast_nullable_to_non_nullable
as Version,
  ));
}

}


/// @nodoc


class _ForceUpdateTargetVersion extends ForceUpdateTargetVersion with DiagnosticableTreeMixin {
  const _ForceUpdateTargetVersion({required this.ios, required this.android}): super._();
  

@override final  Version ios;
@override final  Version android;

/// Create a copy of ForceUpdateTargetVersion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForceUpdateTargetVersionCopyWith<_ForceUpdateTargetVersion> get copyWith => __$ForceUpdateTargetVersionCopyWithImpl<_ForceUpdateTargetVersion>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ForceUpdateTargetVersion'))
    ..add(DiagnosticsProperty('ios', ios))..add(DiagnosticsProperty('android', android));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForceUpdateTargetVersion&&(identical(other.ios, ios) || other.ios == ios)&&(identical(other.android, android) || other.android == android));
}


@override
int get hashCode => Object.hash(runtimeType,ios,android);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ForceUpdateTargetVersion(ios: $ios, android: $android)';
}


}

/// @nodoc
abstract mixin class _$ForceUpdateTargetVersionCopyWith<$Res> implements $ForceUpdateTargetVersionCopyWith<$Res> {
  factory _$ForceUpdateTargetVersionCopyWith(_ForceUpdateTargetVersion value, $Res Function(_ForceUpdateTargetVersion) _then) = __$ForceUpdateTargetVersionCopyWithImpl;
@override @useResult
$Res call({
 Version ios, Version android
});




}
/// @nodoc
class __$ForceUpdateTargetVersionCopyWithImpl<$Res>
    implements _$ForceUpdateTargetVersionCopyWith<$Res> {
  __$ForceUpdateTargetVersionCopyWithImpl(this._self, this._then);

  final _ForceUpdateTargetVersion _self;
  final $Res Function(_ForceUpdateTargetVersion) _then;

/// Create a copy of ForceUpdateTargetVersion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ios = null,Object? android = null,}) {
  return _then(_ForceUpdateTargetVersion(
ios: null == ios ? _self.ios : ios // ignore: cast_nullable_to_non_nullable
as Version,android: null == android ? _self.android : android // ignore: cast_nullable_to_non_nullable
as Version,
  ));
}


}

// dart format on

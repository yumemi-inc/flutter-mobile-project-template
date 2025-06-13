// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'force_update_settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForceUpdateSettingsState implements DiagnosticableTreeMixin {

 bool get enabled;
/// Create a copy of ForceUpdateSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForceUpdateSettingsStateCopyWith<ForceUpdateSettingsState> get copyWith => _$ForceUpdateSettingsStateCopyWithImpl<ForceUpdateSettingsState>(this as ForceUpdateSettingsState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ForceUpdateSettingsState'))
    ..add(DiagnosticsProperty('enabled', enabled));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForceUpdateSettingsState&&(identical(other.enabled, enabled) || other.enabled == enabled));
}


@override
int get hashCode => Object.hash(runtimeType,enabled);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ForceUpdateSettingsState(enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class $ForceUpdateSettingsStateCopyWith<$Res>  {
  factory $ForceUpdateSettingsStateCopyWith(ForceUpdateSettingsState value, $Res Function(ForceUpdateSettingsState) _then) = _$ForceUpdateSettingsStateCopyWithImpl;
@useResult
$Res call({
 bool enabled
});




}
/// @nodoc
class _$ForceUpdateSettingsStateCopyWithImpl<$Res>
    implements $ForceUpdateSettingsStateCopyWith<$Res> {
  _$ForceUpdateSettingsStateCopyWithImpl(this._self, this._then);

  final ForceUpdateSettingsState _self;
  final $Res Function(ForceUpdateSettingsState) _then;

/// Create a copy of ForceUpdateSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _ForceUpdateSettingsState with DiagnosticableTreeMixin implements ForceUpdateSettingsState {
  const _ForceUpdateSettingsState({this.enabled = false});
  

@override@JsonKey() final  bool enabled;

/// Create a copy of ForceUpdateSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForceUpdateSettingsStateCopyWith<_ForceUpdateSettingsState> get copyWith => __$ForceUpdateSettingsStateCopyWithImpl<_ForceUpdateSettingsState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ForceUpdateSettingsState'))
    ..add(DiagnosticsProperty('enabled', enabled));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForceUpdateSettingsState&&(identical(other.enabled, enabled) || other.enabled == enabled));
}


@override
int get hashCode => Object.hash(runtimeType,enabled);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ForceUpdateSettingsState(enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class _$ForceUpdateSettingsStateCopyWith<$Res> implements $ForceUpdateSettingsStateCopyWith<$Res> {
  factory _$ForceUpdateSettingsStateCopyWith(_ForceUpdateSettingsState value, $Res Function(_ForceUpdateSettingsState) _then) = __$ForceUpdateSettingsStateCopyWithImpl;
@override @useResult
$Res call({
 bool enabled
});




}
/// @nodoc
class __$ForceUpdateSettingsStateCopyWithImpl<$Res>
    implements _$ForceUpdateSettingsStateCopyWith<$Res> {
  __$ForceUpdateSettingsStateCopyWithImpl(this._self, this._then);

  final _ForceUpdateSettingsState _self;
  final $Res Function(_ForceUpdateSettingsState) _then;

/// Create a copy of ForceUpdateSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,}) {
  return _then(_ForceUpdateSettingsState(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_mode_settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MaintenanceModeSettingsState {

 bool get enabled;
/// Create a copy of MaintenanceModeSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceModeSettingsStateCopyWith<MaintenanceModeSettingsState> get copyWith => _$MaintenanceModeSettingsStateCopyWithImpl<MaintenanceModeSettingsState>(this as MaintenanceModeSettingsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceModeSettingsState&&(identical(other.enabled, enabled) || other.enabled == enabled));
}


@override
int get hashCode => Object.hash(runtimeType,enabled);

@override
String toString() {
  return 'MaintenanceModeSettingsState(enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class $MaintenanceModeSettingsStateCopyWith<$Res>  {
  factory $MaintenanceModeSettingsStateCopyWith(MaintenanceModeSettingsState value, $Res Function(MaintenanceModeSettingsState) _then) = _$MaintenanceModeSettingsStateCopyWithImpl;
@useResult
$Res call({
 bool enabled
});




}
/// @nodoc
class _$MaintenanceModeSettingsStateCopyWithImpl<$Res>
    implements $MaintenanceModeSettingsStateCopyWith<$Res> {
  _$MaintenanceModeSettingsStateCopyWithImpl(this._self, this._then);

  final MaintenanceModeSettingsState _self;
  final $Res Function(MaintenanceModeSettingsState) _then;

/// Create a copy of MaintenanceModeSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _MaintenanceModeSettingsState implements MaintenanceModeSettingsState {
  const _MaintenanceModeSettingsState({this.enabled = false});
  

@override@JsonKey() final  bool enabled;

/// Create a copy of MaintenanceModeSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceModeSettingsStateCopyWith<_MaintenanceModeSettingsState> get copyWith => __$MaintenanceModeSettingsStateCopyWithImpl<_MaintenanceModeSettingsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaintenanceModeSettingsState&&(identical(other.enabled, enabled) || other.enabled == enabled));
}


@override
int get hashCode => Object.hash(runtimeType,enabled);

@override
String toString() {
  return 'MaintenanceModeSettingsState(enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceModeSettingsStateCopyWith<$Res> implements $MaintenanceModeSettingsStateCopyWith<$Res> {
  factory _$MaintenanceModeSettingsStateCopyWith(_MaintenanceModeSettingsState value, $Res Function(_MaintenanceModeSettingsState) _then) = __$MaintenanceModeSettingsStateCopyWithImpl;
@override @useResult
$Res call({
 bool enabled
});




}
/// @nodoc
class __$MaintenanceModeSettingsStateCopyWithImpl<$Res>
    implements _$MaintenanceModeSettingsStateCopyWith<$Res> {
  __$MaintenanceModeSettingsStateCopyWithImpl(this._self, this._then);

  final _MaintenanceModeSettingsState _self;
  final $Res Function(_MaintenanceModeSettingsState) _then;

/// Create a copy of MaintenanceModeSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,}) {
  return _then(_MaintenanceModeSettingsState(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

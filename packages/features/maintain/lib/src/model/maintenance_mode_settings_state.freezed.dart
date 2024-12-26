// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_mode_settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MaintenanceModeSettingsState {
  bool get enabled => throw _privateConstructorUsedError;

  /// Create a copy of MaintenanceModeSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaintenanceModeSettingsStateCopyWith<MaintenanceModeSettingsState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaintenanceModeSettingsStateCopyWith<$Res> {
  factory $MaintenanceModeSettingsStateCopyWith(
          MaintenanceModeSettingsState value,
          $Res Function(MaintenanceModeSettingsState) then) =
      _$MaintenanceModeSettingsStateCopyWithImpl<$Res,
          MaintenanceModeSettingsState>;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$MaintenanceModeSettingsStateCopyWithImpl<$Res,
        $Val extends MaintenanceModeSettingsState>
    implements $MaintenanceModeSettingsStateCopyWith<$Res> {
  _$MaintenanceModeSettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaintenanceModeSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
  }) {
    return _then(_value.copyWith(
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaintenanceModeSettingsStateImplCopyWith<$Res>
    implements $MaintenanceModeSettingsStateCopyWith<$Res> {
  factory _$$MaintenanceModeSettingsStateImplCopyWith(
          _$MaintenanceModeSettingsStateImpl value,
          $Res Function(_$MaintenanceModeSettingsStateImpl) then) =
      __$$MaintenanceModeSettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class __$$MaintenanceModeSettingsStateImplCopyWithImpl<$Res>
    extends _$MaintenanceModeSettingsStateCopyWithImpl<$Res,
        _$MaintenanceModeSettingsStateImpl>
    implements _$$MaintenanceModeSettingsStateImplCopyWith<$Res> {
  __$$MaintenanceModeSettingsStateImplCopyWithImpl(
      _$MaintenanceModeSettingsStateImpl _value,
      $Res Function(_$MaintenanceModeSettingsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaintenanceModeSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
  }) {
    return _then(_$MaintenanceModeSettingsStateImpl(
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MaintenanceModeSettingsStateImpl
    implements _MaintenanceModeSettingsState {
  const _$MaintenanceModeSettingsStateImpl({this.enabled = false});

  @override
  @JsonKey()
  final bool enabled;

  @override
  String toString() {
    return 'MaintenanceModeSettingsState(enabled: $enabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaintenanceModeSettingsStateImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  /// Create a copy of MaintenanceModeSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaintenanceModeSettingsStateImplCopyWith<
          _$MaintenanceModeSettingsStateImpl>
      get copyWith => __$$MaintenanceModeSettingsStateImplCopyWithImpl<
          _$MaintenanceModeSettingsStateImpl>(this, _$identity);
}

abstract class _MaintenanceModeSettingsState
    implements MaintenanceModeSettingsState {
  const factory _MaintenanceModeSettingsState({final bool enabled}) =
      _$MaintenanceModeSettingsStateImpl;

  @override
  bool get enabled;

  /// Create a copy of MaintenanceModeSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaintenanceModeSettingsStateImplCopyWith<
          _$MaintenanceModeSettingsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

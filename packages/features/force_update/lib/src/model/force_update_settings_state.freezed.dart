// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'force_update_settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForceUpdateSettingsState {
  bool get enabled => throw _privateConstructorUsedError;

  /// Create a copy of ForceUpdateSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForceUpdateSettingsStateCopyWith<ForceUpdateSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForceUpdateSettingsStateCopyWith<$Res> {
  factory $ForceUpdateSettingsStateCopyWith(ForceUpdateSettingsState value,
          $Res Function(ForceUpdateSettingsState) then) =
      _$ForceUpdateSettingsStateCopyWithImpl<$Res, ForceUpdateSettingsState>;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ForceUpdateSettingsStateCopyWithImpl<$Res,
        $Val extends ForceUpdateSettingsState>
    implements $ForceUpdateSettingsStateCopyWith<$Res> {
  _$ForceUpdateSettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForceUpdateSettingsState
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
abstract class _$$ForceUpdateSettingsStateImplCopyWith<$Res>
    implements $ForceUpdateSettingsStateCopyWith<$Res> {
  factory _$$ForceUpdateSettingsStateImplCopyWith(
          _$ForceUpdateSettingsStateImpl value,
          $Res Function(_$ForceUpdateSettingsStateImpl) then) =
      __$$ForceUpdateSettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class __$$ForceUpdateSettingsStateImplCopyWithImpl<$Res>
    extends _$ForceUpdateSettingsStateCopyWithImpl<$Res,
        _$ForceUpdateSettingsStateImpl>
    implements _$$ForceUpdateSettingsStateImplCopyWith<$Res> {
  __$$ForceUpdateSettingsStateImplCopyWithImpl(
      _$ForceUpdateSettingsStateImpl _value,
      $Res Function(_$ForceUpdateSettingsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForceUpdateSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
  }) {
    return _then(_$ForceUpdateSettingsStateImpl(
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ForceUpdateSettingsStateImpl extends _ForceUpdateSettingsState
    with DiagnosticableTreeMixin {
  const _$ForceUpdateSettingsStateImpl({this.enabled = false}) : super._();

  @override
  @JsonKey()
  final bool enabled;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForceUpdateSettingsState(enabled: $enabled)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ForceUpdateSettingsState'))
      ..add(DiagnosticsProperty('enabled', enabled));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForceUpdateSettingsStateImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  /// Create a copy of ForceUpdateSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForceUpdateSettingsStateImplCopyWith<_$ForceUpdateSettingsStateImpl>
      get copyWith => __$$ForceUpdateSettingsStateImplCopyWithImpl<
          _$ForceUpdateSettingsStateImpl>(this, _$identity);
}

abstract class _ForceUpdateSettingsState extends ForceUpdateSettingsState {
  const factory _ForceUpdateSettingsState({final bool enabled}) =
      _$ForceUpdateSettingsStateImpl;
  const _ForceUpdateSettingsState._() : super._();

  @override
  bool get enabled;

  /// Create a copy of ForceUpdateSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForceUpdateSettingsStateImplCopyWith<_$ForceUpdateSettingsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

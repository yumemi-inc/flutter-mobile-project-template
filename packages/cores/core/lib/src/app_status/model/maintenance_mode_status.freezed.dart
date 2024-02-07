// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_mode_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MaintenanceModeStatus {
  bool get enabled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaintenanceModeStatusCopyWith<MaintenanceModeStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaintenanceModeStatusCopyWith<$Res> {
  factory $MaintenanceModeStatusCopyWith(MaintenanceModeStatus value,
          $Res Function(MaintenanceModeStatus) then) =
      _$MaintenanceModeStatusCopyWithImpl<$Res, MaintenanceModeStatus>;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$MaintenanceModeStatusCopyWithImpl<$Res,
        $Val extends MaintenanceModeStatus>
    implements $MaintenanceModeStatusCopyWith<$Res> {
  _$MaintenanceModeStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$MaintenanceModeStatusImplCopyWith<$Res>
    implements $MaintenanceModeStatusCopyWith<$Res> {
  factory _$$MaintenanceModeStatusImplCopyWith(
          _$MaintenanceModeStatusImpl value,
          $Res Function(_$MaintenanceModeStatusImpl) then) =
      __$$MaintenanceModeStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class __$$MaintenanceModeStatusImplCopyWithImpl<$Res>
    extends _$MaintenanceModeStatusCopyWithImpl<$Res,
        _$MaintenanceModeStatusImpl>
    implements _$$MaintenanceModeStatusImplCopyWith<$Res> {
  __$$MaintenanceModeStatusImplCopyWithImpl(_$MaintenanceModeStatusImpl _value,
      $Res Function(_$MaintenanceModeStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
  }) {
    return _then(_$MaintenanceModeStatusImpl(
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MaintenanceModeStatusImpl implements _MaintenanceModeStatus {
  const _$MaintenanceModeStatusImpl({this.enabled = false});

  @override
  @JsonKey()
  final bool enabled;

  @override
  String toString() {
    return 'MaintenanceModeStatus(enabled: $enabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaintenanceModeStatusImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaintenanceModeStatusImplCopyWith<_$MaintenanceModeStatusImpl>
      get copyWith => __$$MaintenanceModeStatusImplCopyWithImpl<
          _$MaintenanceModeStatusImpl>(this, _$identity);
}

abstract class _MaintenanceModeStatus implements MaintenanceModeStatus {
  const factory _MaintenanceModeStatus({final bool enabled}) =
      _$MaintenanceModeStatusImpl;

  @override
  bool get enabled;
  @override
  @JsonKey(ignore: true)
  _$$MaintenanceModeStatusImplCopyWith<_$MaintenanceModeStatusImpl>
      get copyWith => throw _privateConstructorUsedError;
}

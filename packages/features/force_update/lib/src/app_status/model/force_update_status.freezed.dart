// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'force_update_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForceUpdateStatus {
  bool get enabled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForceUpdateStatusCopyWith<ForceUpdateStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForceUpdateStatusCopyWith<$Res> {
  factory $ForceUpdateStatusCopyWith(
          ForceUpdateStatus value, $Res Function(ForceUpdateStatus) then) =
      _$ForceUpdateStatusCopyWithImpl<$Res, ForceUpdateStatus>;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ForceUpdateStatusCopyWithImpl<$Res, $Val extends ForceUpdateStatus>
    implements $ForceUpdateStatusCopyWith<$Res> {
  _$ForceUpdateStatusCopyWithImpl(this._value, this._then);

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
abstract class _$$ForceUpdateStatusImplCopyWith<$Res>
    implements $ForceUpdateStatusCopyWith<$Res> {
  factory _$$ForceUpdateStatusImplCopyWith(_$ForceUpdateStatusImpl value,
          $Res Function(_$ForceUpdateStatusImpl) then) =
      __$$ForceUpdateStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class __$$ForceUpdateStatusImplCopyWithImpl<$Res>
    extends _$ForceUpdateStatusCopyWithImpl<$Res, _$ForceUpdateStatusImpl>
    implements _$$ForceUpdateStatusImplCopyWith<$Res> {
  __$$ForceUpdateStatusImplCopyWithImpl(_$ForceUpdateStatusImpl _value,
      $Res Function(_$ForceUpdateStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
  }) {
    return _then(_$ForceUpdateStatusImpl(
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ForceUpdateStatusImpl extends _ForceUpdateStatus
    with DiagnosticableTreeMixin {
  const _$ForceUpdateStatusImpl({this.enabled = false}) : super._();

  @override
  @JsonKey()
  final bool enabled;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForceUpdateStatus(enabled: $enabled)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ForceUpdateStatus'))
      ..add(DiagnosticsProperty('enabled', enabled));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForceUpdateStatusImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForceUpdateStatusImplCopyWith<_$ForceUpdateStatusImpl> get copyWith =>
      __$$ForceUpdateStatusImplCopyWithImpl<_$ForceUpdateStatusImpl>(
          this, _$identity);
}

abstract class _ForceUpdateStatus extends ForceUpdateStatus {
  const factory _ForceUpdateStatus({final bool enabled}) =
      _$ForceUpdateStatusImpl;
  const _ForceUpdateStatus._() : super._();

  @override
  bool get enabled;
  @override
  @JsonKey(ignore: true)
  _$$ForceUpdateStatusImplCopyWith<_$ForceUpdateStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

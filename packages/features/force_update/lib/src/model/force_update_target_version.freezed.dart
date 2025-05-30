// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'force_update_target_version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForceUpdateTargetVersion {
  VersionString get ios => throw _privateConstructorUsedError;
  VersionString get android => throw _privateConstructorUsedError;

  /// Create a copy of ForceUpdateTargetVersion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForceUpdateTargetVersionCopyWith<ForceUpdateTargetVersion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForceUpdateTargetVersionCopyWith<$Res> {
  factory $ForceUpdateTargetVersionCopyWith(ForceUpdateTargetVersion value,
          $Res Function(ForceUpdateTargetVersion) then) =
      _$ForceUpdateTargetVersionCopyWithImpl<$Res, ForceUpdateTargetVersion>;
  @useResult
  $Res call({VersionString ios, VersionString android});
}

/// @nodoc
class _$ForceUpdateTargetVersionCopyWithImpl<$Res,
        $Val extends ForceUpdateTargetVersion>
    implements $ForceUpdateTargetVersionCopyWith<$Res> {
  _$ForceUpdateTargetVersionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForceUpdateTargetVersion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ios = null,
    Object? android = null,
  }) {
    return _then(_value.copyWith(
      ios: null == ios
          ? _value.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as VersionString,
      android: null == android
          ? _value.android
          : android // ignore: cast_nullable_to_non_nullable
              as VersionString,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForceUpdateTargetVersionImplCopyWith<$Res>
    implements $ForceUpdateTargetVersionCopyWith<$Res> {
  factory _$$ForceUpdateTargetVersionImplCopyWith(
          _$ForceUpdateTargetVersionImpl value,
          $Res Function(_$ForceUpdateTargetVersionImpl) then) =
      __$$ForceUpdateTargetVersionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VersionString ios, VersionString android});
}

/// @nodoc
class __$$ForceUpdateTargetVersionImplCopyWithImpl<$Res>
    extends _$ForceUpdateTargetVersionCopyWithImpl<$Res,
        _$ForceUpdateTargetVersionImpl>
    implements _$$ForceUpdateTargetVersionImplCopyWith<$Res> {
  __$$ForceUpdateTargetVersionImplCopyWithImpl(
      _$ForceUpdateTargetVersionImpl _value,
      $Res Function(_$ForceUpdateTargetVersionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForceUpdateTargetVersion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ios = null,
    Object? android = null,
  }) {
    return _then(_$ForceUpdateTargetVersionImpl(
      ios: null == ios
          ? _value.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as VersionString,
      android: null == android
          ? _value.android
          : android // ignore: cast_nullable_to_non_nullable
              as VersionString,
    ));
  }
}

/// @nodoc

class _$ForceUpdateTargetVersionImpl extends _ForceUpdateTargetVersion
    with DiagnosticableTreeMixin {
  const _$ForceUpdateTargetVersionImpl(
      {required this.ios, required this.android})
      : super._();

  @override
  final VersionString ios;
  @override
  final VersionString android;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForceUpdateTargetVersion(ios: $ios, android: $android)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ForceUpdateTargetVersion'))
      ..add(DiagnosticsProperty('ios', ios))
      ..add(DiagnosticsProperty('android', android));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForceUpdateTargetVersionImpl &&
            (identical(other.ios, ios) || other.ios == ios) &&
            (identical(other.android, android) || other.android == android));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ios, android);

  /// Create a copy of ForceUpdateTargetVersion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForceUpdateTargetVersionImplCopyWith<_$ForceUpdateTargetVersionImpl>
      get copyWith => __$$ForceUpdateTargetVersionImplCopyWithImpl<
          _$ForceUpdateTargetVersionImpl>(this, _$identity);
}

abstract class _ForceUpdateTargetVersion extends ForceUpdateTargetVersion {
  const factory _ForceUpdateTargetVersion(
      {required final VersionString ios,
      required final VersionString android}) = _$ForceUpdateTargetVersionImpl;
  const _ForceUpdateTargetVersion._() : super._();

  @override
  VersionString get ios;
  @override
  VersionString get android;

  /// Create a copy of ForceUpdateTargetVersion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForceUpdateTargetVersionImplCopyWith<_$ForceUpdateTargetVersionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

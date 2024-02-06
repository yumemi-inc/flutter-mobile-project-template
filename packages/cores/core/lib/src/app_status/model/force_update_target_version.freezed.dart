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
  String get ios => throw _privateConstructorUsedError;
  String get android => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForceUpdateTargetVersionCopyWith<ForceUpdateTargetVersion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForceUpdateTargetVersionCopyWith<$Res> {
  factory $ForceUpdateTargetVersionCopyWith(ForceUpdateTargetVersion value,
          $Res Function(ForceUpdateTargetVersion) then) =
      _$ForceUpdateTargetVersionCopyWithImpl<$Res, ForceUpdateTargetVersion>;
  @useResult
  $Res call({String ios, String android});
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
              as String,
      android: null == android
          ? _value.android
          : android // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call({String ios, String android});
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
              as String,
      android: null == android
          ? _value.android
          : android // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ForceUpdateTargetVersionImpl
    with DiagnosticableTreeMixin
    implements _ForceUpdateTargetVersion {
  const _$ForceUpdateTargetVersionImpl({this.ios = '', this.android = ''});

  @override
  @JsonKey()
  final String ios;
  @override
  @JsonKey()
  final String android;

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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForceUpdateTargetVersionImplCopyWith<_$ForceUpdateTargetVersionImpl>
      get copyWith => __$$ForceUpdateTargetVersionImplCopyWithImpl<
          _$ForceUpdateTargetVersionImpl>(this, _$identity);
}

abstract class _ForceUpdateTargetVersion implements ForceUpdateTargetVersion {
  const factory _ForceUpdateTargetVersion(
      {final String ios,
      final String android}) = _$ForceUpdateTargetVersionImpl;

  @override
  String get ios;
  @override
  String get android;
  @override
  @JsonKey(ignore: true)
  _$$ForceUpdateTargetVersionImplCopyWith<_$ForceUpdateTargetVersionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

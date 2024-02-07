// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppStatus {
  MaintenanceModeStatus get maintenanceModeStatus =>
      throw _privateConstructorUsedError;
  ForceUpdateStatus get forceUpdateStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStatusCopyWith<AppStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStatusCopyWith<$Res> {
  factory $AppStatusCopyWith(AppStatus value, $Res Function(AppStatus) then) =
      _$AppStatusCopyWithImpl<$Res, AppStatus>;
  @useResult
  $Res call(
      {MaintenanceModeStatus maintenanceModeStatus,
      ForceUpdateStatus forceUpdateStatus});

  $MaintenanceModeStatusCopyWith<$Res> get maintenanceModeStatus;
  $ForceUpdateStatusCopyWith<$Res> get forceUpdateStatus;
}

/// @nodoc
class _$AppStatusCopyWithImpl<$Res, $Val extends AppStatus>
    implements $AppStatusCopyWith<$Res> {
  _$AppStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maintenanceModeStatus = null,
    Object? forceUpdateStatus = null,
  }) {
    return _then(_value.copyWith(
      maintenanceModeStatus: null == maintenanceModeStatus
          ? _value.maintenanceModeStatus
          : maintenanceModeStatus // ignore: cast_nullable_to_non_nullable
              as MaintenanceModeStatus,
      forceUpdateStatus: null == forceUpdateStatus
          ? _value.forceUpdateStatus
          : forceUpdateStatus // ignore: cast_nullable_to_non_nullable
              as ForceUpdateStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MaintenanceModeStatusCopyWith<$Res> get maintenanceModeStatus {
    return $MaintenanceModeStatusCopyWith<$Res>(_value.maintenanceModeStatus,
        (value) {
      return _then(_value.copyWith(maintenanceModeStatus: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ForceUpdateStatusCopyWith<$Res> get forceUpdateStatus {
    return $ForceUpdateStatusCopyWith<$Res>(_value.forceUpdateStatus, (value) {
      return _then(_value.copyWith(forceUpdateStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppStatusImplCopyWith<$Res>
    implements $AppStatusCopyWith<$Res> {
  factory _$$AppStatusImplCopyWith(
          _$AppStatusImpl value, $Res Function(_$AppStatusImpl) then) =
      __$$AppStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MaintenanceModeStatus maintenanceModeStatus,
      ForceUpdateStatus forceUpdateStatus});

  @override
  $MaintenanceModeStatusCopyWith<$Res> get maintenanceModeStatus;
  @override
  $ForceUpdateStatusCopyWith<$Res> get forceUpdateStatus;
}

/// @nodoc
class __$$AppStatusImplCopyWithImpl<$Res>
    extends _$AppStatusCopyWithImpl<$Res, _$AppStatusImpl>
    implements _$$AppStatusImplCopyWith<$Res> {
  __$$AppStatusImplCopyWithImpl(
      _$AppStatusImpl _value, $Res Function(_$AppStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maintenanceModeStatus = null,
    Object? forceUpdateStatus = null,
  }) {
    return _then(_$AppStatusImpl(
      maintenanceModeStatus: null == maintenanceModeStatus
          ? _value.maintenanceModeStatus
          : maintenanceModeStatus // ignore: cast_nullable_to_non_nullable
              as MaintenanceModeStatus,
      forceUpdateStatus: null == forceUpdateStatus
          ? _value.forceUpdateStatus
          : forceUpdateStatus // ignore: cast_nullable_to_non_nullable
              as ForceUpdateStatus,
    ));
  }
}

/// @nodoc

class _$AppStatusImpl with DiagnosticableTreeMixin implements _AppStatus {
  const _$AppStatusImpl(
      {required this.maintenanceModeStatus, required this.forceUpdateStatus});

  @override
  final MaintenanceModeStatus maintenanceModeStatus;
  @override
  final ForceUpdateStatus forceUpdateStatus;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppStatus(maintenanceModeStatus: $maintenanceModeStatus, forceUpdateStatus: $forceUpdateStatus)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppStatus'))
      ..add(DiagnosticsProperty('maintenanceModeStatus', maintenanceModeStatus))
      ..add(DiagnosticsProperty('forceUpdateStatus', forceUpdateStatus));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStatusImpl &&
            (identical(other.maintenanceModeStatus, maintenanceModeStatus) ||
                other.maintenanceModeStatus == maintenanceModeStatus) &&
            (identical(other.forceUpdateStatus, forceUpdateStatus) ||
                other.forceUpdateStatus == forceUpdateStatus));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, maintenanceModeStatus, forceUpdateStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStatusImplCopyWith<_$AppStatusImpl> get copyWith =>
      __$$AppStatusImplCopyWithImpl<_$AppStatusImpl>(this, _$identity);
}

abstract class _AppStatus implements AppStatus {
  const factory _AppStatus(
      {required final MaintenanceModeStatus maintenanceModeStatus,
      required final ForceUpdateStatus forceUpdateStatus}) = _$AppStatusImpl;

  @override
  MaintenanceModeStatus get maintenanceModeStatus;
  @override
  ForceUpdateStatus get forceUpdateStatus;
  @override
  @JsonKey(ignore: true)
  _$$AppStatusImplCopyWith<_$AppStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

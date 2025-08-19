// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operational_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OperationalSettings {

 MaintenancePolicy get maintenancePolicy; ForceUpdatePolicy get forceUpdatePolicy;
/// Create a copy of OperationalSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OperationalSettingsCopyWith<OperationalSettings> get copyWith => _$OperationalSettingsCopyWithImpl<OperationalSettings>(this as OperationalSettings, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OperationalSettings&&(identical(other.maintenancePolicy, maintenancePolicy) || other.maintenancePolicy == maintenancePolicy)&&(identical(other.forceUpdatePolicy, forceUpdatePolicy) || other.forceUpdatePolicy == forceUpdatePolicy));
}


@override
int get hashCode => Object.hash(runtimeType,maintenancePolicy,forceUpdatePolicy);

@override
String toString() {
  return 'OperationalSettings(maintenancePolicy: $maintenancePolicy, forceUpdatePolicy: $forceUpdatePolicy)';
}


}

/// @nodoc
abstract mixin class $OperationalSettingsCopyWith<$Res>  {
  factory $OperationalSettingsCopyWith(OperationalSettings value, $Res Function(OperationalSettings) _then) = _$OperationalSettingsCopyWithImpl;
@useResult
$Res call({
 MaintenancePolicy maintenancePolicy, ForceUpdatePolicy forceUpdatePolicy
});


$MaintenancePolicyCopyWith<$Res> get maintenancePolicy;$ForceUpdatePolicyCopyWith<$Res> get forceUpdatePolicy;

}
/// @nodoc
class _$OperationalSettingsCopyWithImpl<$Res>
    implements $OperationalSettingsCopyWith<$Res> {
  _$OperationalSettingsCopyWithImpl(this._self, this._then);

  final OperationalSettings _self;
  final $Res Function(OperationalSettings) _then;

/// Create a copy of OperationalSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? maintenancePolicy = null,Object? forceUpdatePolicy = null,}) {
  return _then(_self.copyWith(
maintenancePolicy: null == maintenancePolicy ? _self.maintenancePolicy : maintenancePolicy // ignore: cast_nullable_to_non_nullable
as MaintenancePolicy,forceUpdatePolicy: null == forceUpdatePolicy ? _self.forceUpdatePolicy : forceUpdatePolicy // ignore: cast_nullable_to_non_nullable
as ForceUpdatePolicy,
  ));
}
/// Create a copy of OperationalSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MaintenancePolicyCopyWith<$Res> get maintenancePolicy {
  
  return $MaintenancePolicyCopyWith<$Res>(_self.maintenancePolicy, (value) {
    return _then(_self.copyWith(maintenancePolicy: value));
  });
}/// Create a copy of OperationalSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ForceUpdatePolicyCopyWith<$Res> get forceUpdatePolicy {
  
  return $ForceUpdatePolicyCopyWith<$Res>(_self.forceUpdatePolicy, (value) {
    return _then(_self.copyWith(forceUpdatePolicy: value));
  });
}
}


/// @nodoc


class _OperationalSettings extends OperationalSettings {
  const _OperationalSettings({required this.maintenancePolicy, required this.forceUpdatePolicy}): super._();
  

@override final  MaintenancePolicy maintenancePolicy;
@override final  ForceUpdatePolicy forceUpdatePolicy;

/// Create a copy of OperationalSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OperationalSettingsCopyWith<_OperationalSettings> get copyWith => __$OperationalSettingsCopyWithImpl<_OperationalSettings>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OperationalSettings&&(identical(other.maintenancePolicy, maintenancePolicy) || other.maintenancePolicy == maintenancePolicy)&&(identical(other.forceUpdatePolicy, forceUpdatePolicy) || other.forceUpdatePolicy == forceUpdatePolicy));
}


@override
int get hashCode => Object.hash(runtimeType,maintenancePolicy,forceUpdatePolicy);

@override
String toString() {
  return 'OperationalSettings(maintenancePolicy: $maintenancePolicy, forceUpdatePolicy: $forceUpdatePolicy)';
}


}

/// @nodoc
abstract mixin class _$OperationalSettingsCopyWith<$Res> implements $OperationalSettingsCopyWith<$Res> {
  factory _$OperationalSettingsCopyWith(_OperationalSettings value, $Res Function(_OperationalSettings) _then) = __$OperationalSettingsCopyWithImpl;
@override @useResult
$Res call({
 MaintenancePolicy maintenancePolicy, ForceUpdatePolicy forceUpdatePolicy
});


@override $MaintenancePolicyCopyWith<$Res> get maintenancePolicy;@override $ForceUpdatePolicyCopyWith<$Res> get forceUpdatePolicy;

}
/// @nodoc
class __$OperationalSettingsCopyWithImpl<$Res>
    implements _$OperationalSettingsCopyWith<$Res> {
  __$OperationalSettingsCopyWithImpl(this._self, this._then);

  final _OperationalSettings _self;
  final $Res Function(_OperationalSettings) _then;

/// Create a copy of OperationalSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? maintenancePolicy = null,Object? forceUpdatePolicy = null,}) {
  return _then(_OperationalSettings(
maintenancePolicy: null == maintenancePolicy ? _self.maintenancePolicy : maintenancePolicy // ignore: cast_nullable_to_non_nullable
as MaintenancePolicy,forceUpdatePolicy: null == forceUpdatePolicy ? _self.forceUpdatePolicy : forceUpdatePolicy // ignore: cast_nullable_to_non_nullable
as ForceUpdatePolicy,
  ));
}

/// Create a copy of OperationalSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MaintenancePolicyCopyWith<$Res> get maintenancePolicy {
  
  return $MaintenancePolicyCopyWith<$Res>(_self.maintenancePolicy, (value) {
    return _then(_self.copyWith(maintenancePolicy: value));
  });
}/// Create a copy of OperationalSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ForceUpdatePolicyCopyWith<$Res> get forceUpdatePolicy {
  
  return $ForceUpdatePolicyCopyWith<$Res>(_self.forceUpdatePolicy, (value) {
    return _then(_self.copyWith(forceUpdatePolicy: value));
  });
}
}

/// @nodoc
mixin _$MaintenancePolicy {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenancePolicy);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MaintenancePolicy()';
}


}

/// @nodoc
class $MaintenancePolicyCopyWith<$Res>  {
$MaintenancePolicyCopyWith(MaintenancePolicy _, $Res Function(MaintenancePolicy) __);
}


/// @nodoc


class MaintenanceEnabled implements MaintenancePolicy {
  const MaintenanceEnabled({required this.message});
  

 final  String message;

/// Create a copy of MaintenancePolicy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceEnabledCopyWith<MaintenanceEnabled> get copyWith => _$MaintenanceEnabledCopyWithImpl<MaintenanceEnabled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceEnabled&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MaintenancePolicy.enabled(message: $message)';
}


}

/// @nodoc
abstract mixin class $MaintenanceEnabledCopyWith<$Res> implements $MaintenancePolicyCopyWith<$Res> {
  factory $MaintenanceEnabledCopyWith(MaintenanceEnabled value, $Res Function(MaintenanceEnabled) _then) = _$MaintenanceEnabledCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$MaintenanceEnabledCopyWithImpl<$Res>
    implements $MaintenanceEnabledCopyWith<$Res> {
  _$MaintenanceEnabledCopyWithImpl(this._self, this._then);

  final MaintenanceEnabled _self;
  final $Res Function(MaintenanceEnabled) _then;

/// Create a copy of MaintenancePolicy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(MaintenanceEnabled(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MaintenanceDisabled implements MaintenancePolicy {
  const MaintenanceDisabled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceDisabled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MaintenancePolicy.disabled()';
}


}




/// @nodoc
mixin _$ForceUpdatePolicy {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForceUpdatePolicy);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForceUpdatePolicy()';
}


}

/// @nodoc
class $ForceUpdatePolicyCopyWith<$Res>  {
$ForceUpdatePolicyCopyWith(ForceUpdatePolicy _, $Res Function(ForceUpdatePolicy) __);
}


/// @nodoc


class ForceUpdateEnabled implements ForceUpdatePolicy {
  const ForceUpdateEnabled({required this.minimumVersions});
  

 final  RequiredVersions minimumVersions;

/// Create a copy of ForceUpdatePolicy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForceUpdateEnabledCopyWith<ForceUpdateEnabled> get copyWith => _$ForceUpdateEnabledCopyWithImpl<ForceUpdateEnabled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForceUpdateEnabled&&(identical(other.minimumVersions, minimumVersions) || other.minimumVersions == minimumVersions));
}


@override
int get hashCode => Object.hash(runtimeType,minimumVersions);

@override
String toString() {
  return 'ForceUpdatePolicy.enabled(minimumVersions: $minimumVersions)';
}


}

/// @nodoc
abstract mixin class $ForceUpdateEnabledCopyWith<$Res> implements $ForceUpdatePolicyCopyWith<$Res> {
  factory $ForceUpdateEnabledCopyWith(ForceUpdateEnabled value, $Res Function(ForceUpdateEnabled) _then) = _$ForceUpdateEnabledCopyWithImpl;
@useResult
$Res call({
 RequiredVersions minimumVersions
});


$RequiredVersionsCopyWith<$Res> get minimumVersions;

}
/// @nodoc
class _$ForceUpdateEnabledCopyWithImpl<$Res>
    implements $ForceUpdateEnabledCopyWith<$Res> {
  _$ForceUpdateEnabledCopyWithImpl(this._self, this._then);

  final ForceUpdateEnabled _self;
  final $Res Function(ForceUpdateEnabled) _then;

/// Create a copy of ForceUpdatePolicy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? minimumVersions = null,}) {
  return _then(ForceUpdateEnabled(
minimumVersions: null == minimumVersions ? _self.minimumVersions : minimumVersions // ignore: cast_nullable_to_non_nullable
as RequiredVersions,
  ));
}

/// Create a copy of ForceUpdatePolicy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequiredVersionsCopyWith<$Res> get minimumVersions {
  
  return $RequiredVersionsCopyWith<$Res>(_self.minimumVersions, (value) {
    return _then(_self.copyWith(minimumVersions: value));
  });
}
}

/// @nodoc


class ForceUpdateDisabled implements ForceUpdatePolicy {
  const ForceUpdateDisabled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForceUpdateDisabled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForceUpdatePolicy.disabled()';
}


}




/// @nodoc
mixin _$RequiredVersions {

 Version get ios; Version get android;
/// Create a copy of RequiredVersions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequiredVersionsCopyWith<RequiredVersions> get copyWith => _$RequiredVersionsCopyWithImpl<RequiredVersions>(this as RequiredVersions, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequiredVersions&&(identical(other.ios, ios) || other.ios == ios)&&(identical(other.android, android) || other.android == android));
}


@override
int get hashCode => Object.hash(runtimeType,ios,android);

@override
String toString() {
  return 'RequiredVersions(ios: $ios, android: $android)';
}


}

/// @nodoc
abstract mixin class $RequiredVersionsCopyWith<$Res>  {
  factory $RequiredVersionsCopyWith(RequiredVersions value, $Res Function(RequiredVersions) _then) = _$RequiredVersionsCopyWithImpl;
@useResult
$Res call({
 Version ios, Version android
});




}
/// @nodoc
class _$RequiredVersionsCopyWithImpl<$Res>
    implements $RequiredVersionsCopyWith<$Res> {
  _$RequiredVersionsCopyWithImpl(this._self, this._then);

  final RequiredVersions _self;
  final $Res Function(RequiredVersions) _then;

/// Create a copy of RequiredVersions
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


class _RequiredVersions extends RequiredVersions {
  const _RequiredVersions({required this.ios, required this.android}): super._();
  

@override final  Version ios;
@override final  Version android;

/// Create a copy of RequiredVersions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequiredVersionsCopyWith<_RequiredVersions> get copyWith => __$RequiredVersionsCopyWithImpl<_RequiredVersions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequiredVersions&&(identical(other.ios, ios) || other.ios == ios)&&(identical(other.android, android) || other.android == android));
}


@override
int get hashCode => Object.hash(runtimeType,ios,android);

@override
String toString() {
  return 'RequiredVersions(ios: $ios, android: $android)';
}


}

/// @nodoc
abstract mixin class _$RequiredVersionsCopyWith<$Res> implements $RequiredVersionsCopyWith<$Res> {
  factory _$RequiredVersionsCopyWith(_RequiredVersions value, $Res Function(_RequiredVersions) _then) = __$RequiredVersionsCopyWithImpl;
@override @useResult
$Res call({
 Version ios, Version android
});




}
/// @nodoc
class __$RequiredVersionsCopyWithImpl<$Res>
    implements _$RequiredVersionsCopyWith<$Res> {
  __$RequiredVersionsCopyWithImpl(this._self, this._then);

  final _RequiredVersions _self;
  final $Res Function(_RequiredVersions) _then;

/// Create a copy of RequiredVersions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ios = null,Object? android = null,}) {
  return _then(_RequiredVersions(
ios: null == ios ? _self.ios : ios // ignore: cast_nullable_to_non_nullable
as Version,android: null == android ? _self.android : android // ignore: cast_nullable_to_non_nullable
as Version,
  ));
}


}

// dart format on

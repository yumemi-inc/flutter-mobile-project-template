// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'github_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GitHubRepository {

 String get name; String? get description;
/// Create a copy of GitHubRepository
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GitHubRepositoryCopyWith<GitHubRepository> get copyWith => _$GitHubRepositoryCopyWithImpl<GitHubRepository>(this as GitHubRepository, _$identity);

  /// Serializes this GitHubRepository to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GitHubRepository&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description);

@override
String toString() {
  return 'GitHubRepository(name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class $GitHubRepositoryCopyWith<$Res>  {
  factory $GitHubRepositoryCopyWith(GitHubRepository value, $Res Function(GitHubRepository) _then) = _$GitHubRepositoryCopyWithImpl;
@useResult
$Res call({
 String name, String? description
});




}
/// @nodoc
class _$GitHubRepositoryCopyWithImpl<$Res>
    implements $GitHubRepositoryCopyWith<$Res> {
  _$GitHubRepositoryCopyWithImpl(this._self, this._then);

  final GitHubRepository _self;
  final $Res Function(GitHubRepository) _then;

/// Create a copy of GitHubRepository
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GitHubRepository implements GitHubRepository {
  const _GitHubRepository({required this.name, required this.description});
  factory _GitHubRepository.fromJson(Map<String, dynamic> json) => _$GitHubRepositoryFromJson(json);

@override final  String name;
@override final  String? description;

/// Create a copy of GitHubRepository
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GitHubRepositoryCopyWith<_GitHubRepository> get copyWith => __$GitHubRepositoryCopyWithImpl<_GitHubRepository>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GitHubRepositoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GitHubRepository&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description);

@override
String toString() {
  return 'GitHubRepository(name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class _$GitHubRepositoryCopyWith<$Res> implements $GitHubRepositoryCopyWith<$Res> {
  factory _$GitHubRepositoryCopyWith(_GitHubRepository value, $Res Function(_GitHubRepository) _then) = __$GitHubRepositoryCopyWithImpl;
@override @useResult
$Res call({
 String name, String? description
});




}
/// @nodoc
class __$GitHubRepositoryCopyWithImpl<$Res>
    implements _$GitHubRepositoryCopyWith<$Res> {
  __$GitHubRepositoryCopyWithImpl(this._self, this._then);

  final _GitHubRepository _self;
  final $Res Function(_GitHubRepository) _then;

/// Create a copy of GitHubRepository
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = freezed,}) {
  return _then(_GitHubRepository(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

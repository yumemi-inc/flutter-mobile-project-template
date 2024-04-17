// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'github_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GitHubRepository _$GitHubRepositoryFromJson(Map<String, dynamic> json) {
  return _GitHubRepository.fromJson(json);
}

/// @nodoc
mixin _$GitHubRepository {
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GitHubRepositoryCopyWith<GitHubRepository> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GitHubRepositoryCopyWith<$Res> {
  factory $GitHubRepositoryCopyWith(
          GitHubRepository value, $Res Function(GitHubRepository) then) =
      _$GitHubRepositoryCopyWithImpl<$Res, GitHubRepository>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$GitHubRepositoryCopyWithImpl<$Res, $Val extends GitHubRepository>
    implements $GitHubRepositoryCopyWith<$Res> {
  _$GitHubRepositoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GitHubRepositoryImplCopyWith<$Res>
    implements $GitHubRepositoryCopyWith<$Res> {
  factory _$$GitHubRepositoryImplCopyWith(_$GitHubRepositoryImpl value,
          $Res Function(_$GitHubRepositoryImpl) then) =
      __$$GitHubRepositoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$GitHubRepositoryImplCopyWithImpl<$Res>
    extends _$GitHubRepositoryCopyWithImpl<$Res, _$GitHubRepositoryImpl>
    implements _$$GitHubRepositoryImplCopyWith<$Res> {
  __$$GitHubRepositoryImplCopyWithImpl(_$GitHubRepositoryImpl _value,
      $Res Function(_$GitHubRepositoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$GitHubRepositoryImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GitHubRepositoryImpl implements _GitHubRepository {
  const _$GitHubRepositoryImpl({required this.name});

  factory _$GitHubRepositoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$GitHubRepositoryImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'GitHubRepository(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GitHubRepositoryImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GitHubRepositoryImplCopyWith<_$GitHubRepositoryImpl> get copyWith =>
      __$$GitHubRepositoryImplCopyWithImpl<_$GitHubRepositoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GitHubRepositoryImplToJson(
      this,
    );
  }
}

abstract class _GitHubRepository implements GitHubRepository {
  const factory _GitHubRepository({required final String name}) =
      _$GitHubRepositoryImpl;

  factory _GitHubRepository.fromJson(Map<String, dynamic> json) =
      _$GitHubRepositoryImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$GitHubRepositoryImplCopyWith<_$GitHubRepositoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

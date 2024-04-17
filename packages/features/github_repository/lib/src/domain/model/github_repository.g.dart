// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'github_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GithubRepositoryImpl _$$GithubRepositoryImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$GithubRepositoryImpl',
      json,
      ($checkedConvert) {
        final val = _$GithubRepositoryImpl(
          name: $checkedConvert('name', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$GithubRepositoryImplToJson(
        _$GithubRepositoryImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'github_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GitHubRepositoryImpl _$$GitHubRepositoryImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$GitHubRepositoryImpl',
      json,
      ($checkedConvert) {
        final val = _$GitHubRepositoryImpl(
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$GitHubRepositoryImplToJson(
        _$GitHubRepositoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

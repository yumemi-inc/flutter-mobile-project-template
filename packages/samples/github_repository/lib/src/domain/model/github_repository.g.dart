// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore, deprecated_member_use

part of 'github_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GitHubRepository _$GitHubRepositoryFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_GitHubRepository', json, ($checkedConvert) {
      final val = _GitHubRepository(
        name: $checkedConvert('name', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$GitHubRepositoryToJson(_GitHubRepository instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
    };

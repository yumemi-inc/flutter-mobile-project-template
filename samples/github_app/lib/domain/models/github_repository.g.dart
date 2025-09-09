// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GitHubRepository _$GitHubRepositoryFromJson(Map<String, dynamic> json) =>
    _GitHubRepository(
      name: json['name'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$GitHubRepositoryToJson(_GitHubRepository instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
    };

import 'package:cores_core/pagination.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_repository.freezed.dart';
part 'github_repository.g.dart';

@freezed
class GitHubRepository with _$GitHubRepository implements PagingDataItem<int> {
  const factory GitHubRepository({
    required int id,
    required String name,
  }) = _GitHubRepository;

  factory GitHubRepository.fromJson(Map<String, dynamic> json) =>
      _$GitHubRepositoryFromJson(json);
}

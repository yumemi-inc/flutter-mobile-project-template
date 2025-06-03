import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internal_domain_model/src/version_string.dart';

part 'force_update_target_version.freezed.dart';

@freezed
class ForceUpdateTargetVersion with _$ForceUpdateTargetVersion {
  const factory ForceUpdateTargetVersion({
    required VersionString ios,
    required VersionString android,
  }) = _ForceUpdateTargetVersion;

  const ForceUpdateTargetVersion._();

  VersionString? get defaultTargetPlatformVersion {
    return switch (defaultTargetPlatform) {
      TargetPlatform.android => android,
      TargetPlatform.iOS => ios,
      _ => null,
    };
  }
}

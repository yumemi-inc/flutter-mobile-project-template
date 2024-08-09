import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'force_update_target_version.freezed.dart';

@freezed
class ForceUpdateTargetVersion with _$ForceUpdateTargetVersion {
  const factory ForceUpdateTargetVersion({
    @Default('') String ios,
    @Default('') String android,
  }) = _ForceUpdateTargetVersion;
}

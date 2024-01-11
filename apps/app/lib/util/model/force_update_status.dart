import 'package:flutter/foundation.dart';
import 'package:flutter_app/util/model/force_update_target_version.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'force_update_status.freezed.dart';

@freezed
class ForceUpdateStatus with _$ForceUpdateStatus {
   const factory ForceUpdateStatus({
    @Default(false) bool enabled,
  }) = _ForceUpdateStatus;
  
  const ForceUpdateStatus._();

  bool shouldForceUpdate({
    required ForceUpdateTargetVersion forceUpdateTargetVersion,
  }) {
    // TODO: バージョンの判定処理を書く
    return false;
  }
}

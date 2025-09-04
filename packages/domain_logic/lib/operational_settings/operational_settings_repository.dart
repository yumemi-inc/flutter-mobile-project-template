import 'package:internal_domain_model/operational_settings/operational_settings.dart';

/// 運用設定集約ルートのリポジトリインターフェース
abstract interface class OperationalSettingsRepository {
  /// 運用設定集約ルートを取得する
  Future<OperationalSettings> getOperationalSettings();
}

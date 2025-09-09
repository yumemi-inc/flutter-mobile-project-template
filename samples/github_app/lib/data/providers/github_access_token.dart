import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'github_access_token.g.dart';

@riverpod
String? gitHubAccessToken(Ref ref) {
  // GitHubのアクセストークンは環境変数や設定ファイルから取得
  // サンプルではnullを返す（認証なしでAPIを使用）
  return null;
}

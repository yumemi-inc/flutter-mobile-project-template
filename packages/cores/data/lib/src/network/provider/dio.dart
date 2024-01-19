import 'package:cores_core/exception.dart';
import 'package:cores_data/src/network/provider/github_access_token.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final gitHubAccessToken = ref.watch(gitHubAccessTokenProvider);

  final options = BaseOptions(
    baseUrl: 'https://api.github.com',
    headers: {
      if (gitHubAccessToken != null)
        'Authorization': 'token $gitHubAccessToken',
    },
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  );
  final dio = Dio(options);

  dio.interceptors.add(LogInterceptor());
  dio.interceptors.add(
    InterceptorsWrapper(
      onError: (e, handler) {
        throw NetworkException.fromStatusCode(e.response?.statusCode);
      },
    ),
  );

  return dio;
}

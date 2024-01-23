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

extension DioExtension on Dio {
  Future<T> safeRequest<T>({
    required Future<T> Function() request,
  }) =>
      _wrapDioException<T>(request);

  /// Handle [DioException] and convert it to [AppException]
  Future<T> _wrapDioException<T>(
      Future<T> Function() request,
      ) async {
    try {
      final result = await request();
      return result;
    } on DioException catch (e) {
      final customException = _convertDioExceptionToNetworkException(e);
      throw customException;
    }
  }

  AppException _convertDioExceptionToNetworkException(DioException e) {
    return NetworkException.fromStatusCode(e.response?.statusCode);
  }
}

import 'package:cores_core/exception.dart';
import 'package:cores_data/network.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exception_generator_api.g.dart';

@riverpod
class ExceptionGeneratorApi extends _$ExceptionGeneratorApi {
  @override
  Future<String> build() async {
    return Future.value('Test');
  }

  Future<void> request() async {
    state = const AsyncValue.loading();
    try {
      final dio = ref.read(dioProvider);
      await dio.safeRequest<void>(
        request: () {
          throw DioException(
            response: Response(
              statusCode: 400,
              requestOptions: RequestOptions(path: 'Test'),
            ),
            requestOptions: RequestOptions(path: 'Test'),
          );
        },
      );
    } on AppException catch (e, stackTrace) {
      ref.read(appExceptionNotifierProvider.notifier).notify(e);
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

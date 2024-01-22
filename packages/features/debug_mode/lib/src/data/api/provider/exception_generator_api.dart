import 'package:dio/dio.dart';
import 'package:flutter_app/core/app_exception.dart';
import 'package:flutter_app/data/provider/dio.dart';
import 'package:flutter_app/util/provider/app_exception_notifier_provider.dart';
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
      final dio = ref.watch(dioProvider);
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

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exception_generator_api.g.dart';

@riverpod
class ExceptionGeneratorApi extends _$ExceptionGeneratorApi {
  @override
  Future<String> build() {
    return Future.value('Test');
  }

  Future<void> request() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => throw UnimplementedError());
  }
}

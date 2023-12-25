sealed class AppException implements Exception {
  AppException();
}

sealed class NetworkException extends AppException {
  NetworkException();

  factory NetworkException.fromStatusCode(int? statusCode) {
    if (statusCode == null) {
      return UnknownNetworkException();
    }

    return switch (statusCode) {
      >= 400 && < 500 => ClientNetworkException(),
      >= 500 && < 600 => ServerNetworkException(),
      _ => throw ArgumentError(
          'Invalid status code: $statusCode.',
          'statusCode',
        ),
    };
  }
}

class ClientNetworkException extends NetworkException {}

class ServerNetworkException extends NetworkException {}

class UnknownNetworkException extends NetworkException {}

class UnknownException extends AppException {}

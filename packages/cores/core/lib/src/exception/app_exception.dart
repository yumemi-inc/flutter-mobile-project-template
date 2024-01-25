sealed class AppException implements Exception {
  const AppException(this.message);

  final String message;
}

sealed class NetworkException extends AppException {
  const NetworkException(super.message);

  factory NetworkException.fromStatusCode(int? statusCode) {
    if (statusCode == null) {
      return const UnknownNetworkException();
    }

    return switch (statusCode) {
      >= 400 && < 500 => ClientNetworkException(
          'Client error occurred($statusCode)',
        ),
      >= 500 && < 600 => ServerNetworkException(
          'Server error occurred($statusCode)',
        ),
      _ => throw ArgumentError(
          'Invalid status code: $statusCode.',
          'statusCode',
        ),
    };
  }
}

class ClientNetworkException extends NetworkException {
  const ClientNetworkException(super.message);
}

class ServerNetworkException extends NetworkException {
  const ServerNetworkException(super.message);
}

class UnknownNetworkException extends NetworkException {
  const UnknownNetworkException() : super('Unknown network error occurred');
}

class UnknownException extends AppException {
  const UnknownException() : super('Unknown error occurred');
}

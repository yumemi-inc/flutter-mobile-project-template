sealed class AppException implements Exception {
  AppException(this.message);

  final String message;
}

sealed class NetworkException extends AppException {
  NetworkException(super.message);

  factory NetworkException.fromStatusCode(int? statusCode) {
    if (statusCode == null) {
      return UnknownNetworkException();
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
  ClientNetworkException(super.message);
}

class ServerNetworkException extends NetworkException {
  ServerNetworkException(super.message);
}

class UnknownNetworkException extends NetworkException {
  UnknownNetworkException() : super('Unknown network error occurred');
}

class UnknownException extends AppException {
  UnknownException() : super('Unknown error occurred');
}

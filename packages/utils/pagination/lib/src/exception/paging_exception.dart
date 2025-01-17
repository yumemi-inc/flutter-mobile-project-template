sealed class PagingException implements Exception {
  const PagingException(this.message);

  final String message;
}

sealed class PagingNetworkException extends PagingException {
  const PagingNetworkException(super.message);
}

final class PagingClientNetworkException extends PagingNetworkException {
  const PagingClientNetworkException(super.message);
}

final class PagingServerNetworkException extends PagingNetworkException {
  const PagingServerNetworkException(super.message);
}

final class PagingUnknownNetworkException extends PagingNetworkException {
  const PagingUnknownNetworkException()
      : super('Unknown network error occurred');
}

final class PagingUnknownException extends PagingException {
  const PagingUnknownException() : super('Unknown error occurred');
}

class Failure implements Exception {
  final String message;

  Failure(message) : message = message ?? 'Unexpected error';
  @override
  toString() => message;
}


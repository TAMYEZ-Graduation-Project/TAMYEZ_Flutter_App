sealed class AppException implements Exception {}

class ServerException extends AppException {
  final int? statusCode;
  final String? message; // raw backend message

  ServerException({this.statusCode, this.message});
}

class NetworkException extends AppException {}

class CacheException extends AppException {}

class UnauthorizedException extends AppException {}

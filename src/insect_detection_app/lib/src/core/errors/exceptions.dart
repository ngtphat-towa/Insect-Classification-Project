import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final String message;
  final int statusCode;
  final String? endpoint;
  final dynamic requestBody;

  const ServerException(
    this.message, {
    required this.statusCode,
    this.endpoint,
    this.requestBody,
  });

  @override
  String toString() =>
      'ServerException: $message (statusCode: $statusCode, endpoint: $endpoint, requestBody: $requestBody)';

  @override
  List<Object?> get props => [message, statusCode, endpoint, requestBody];
}

class CacheException extends Equatable implements Exception {
  final String userFriendlyMessage; // Added for user-facing message
  final String? technicalErrorMessage; // Added for debugging
  const CacheException(
    this.userFriendlyMessage, {
    this.technicalErrorMessage,
  });

  String get message => userFriendlyMessage; // Expose user-friendly message

  @override
  String toString() => 'CacheException: $technicalErrorMessage';

  @override
  List<Object?> get props => [userFriendlyMessage, technicalErrorMessage];
}

class ConnectionException implements Exception {
  const ConnectionException();

  @override
  String toString() => 'ConnectionException: Unable to connect';
}

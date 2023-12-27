import 'package:equatable/equatable.dart';

import 'package:insect_detection_app/src/core/errors/exceptions.dart';

class Failure extends Equatable {
  final String message;
  const Failure(
    this.message,
  );
  String get errorMessage => 'Error: $message';
  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  final int statusCode;

  const ServerFailure({
    required String message,
    required this.statusCode,
  }) : super(message);

  factory ServerFailure.fromException(
    ServerException exception,
  ) =>
      ServerFailure(
        message: exception.message,
        statusCode: exception.statusCode,
      );
  @override
  List<Object?> get props => [message, statusCode];
}

class CacheFailure extends Failure {
  final String? technicalErrorMessage;

  const CacheFailure(
    super.message, {
    this.technicalErrorMessage,
  });

  factory CacheFailure.fromException({required CacheException exception}) =>
      CacheFailure(
        exception.userFriendlyMessage,
        technicalErrorMessage: exception.technicalErrorMessage,
      );
  @override
  List<Object?> get props => [
        message,
        technicalErrorMessage,
      ];
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(super.message);

  factory ConnectionFailure.fromException(
          {required ConnectionException exception}) =>
      ConnectionFailure(exception.toString());
}

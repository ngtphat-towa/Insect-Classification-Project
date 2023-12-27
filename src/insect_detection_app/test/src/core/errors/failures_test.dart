import 'package:flutter_test/flutter_test.dart';

import 'package:insect_detection_app/src/core/errors/exceptions.dart';
import 'package:insect_detection_app/src/core/errors/failures.dart';

void main() {
  group('Failure', () {
    test('should create a Failure with a message', () {
      const failure = Failure('Something went wrong');
      expect(failure.message, 'Something went wrong');
      expect(failure.errorMessage, 'Error: Something went wrong');
    });
  });

  group('ServerFailure', () {
    test('should create a ServerFailure', () {
      const failure = ServerFailure(
        message: 'Server error',
        statusCode: 400,
      );
      expect(failure.message, 'Server error');
      expect(failure.statusCode, 400);
    });

    test('should create from a ServerException', () {
      const exception = ServerException('Server error', statusCode: 400);
      final failure = ServerFailure.fromException(exception);
      expect(failure.message, exception.message);
      expect(failure.statusCode, exception.statusCode);
    });
  });

  group('CacheFailure', () {
    test('should create a CacheFailure', () {
      const failure = CacheFailure('Cache error',
          technicalErrorMessage: 'Technical details');
      expect(failure.message, 'Cache error');
      expect(failure.technicalErrorMessage, 'Technical details');
    });

    test('should create from a CacheException', () {
      const exception = CacheException('User-friendly message',
          technicalErrorMessage: 'Technical details');
      final failure = CacheFailure.fromException(exception: exception);
      expect(failure.message, exception.userFriendlyMessage);
      expect(failure.technicalErrorMessage, exception.technicalErrorMessage);
    });
  });

  group('ConnectionFailure', () {
    test('should create a ConnectionFailure', () {
      const failure = ConnectionFailure('Connection error');
      expect(failure.message, 'Connection error');
    });

    test('should create from a ConnectionException', () {
      const exception = ConnectionException();
      final failure = ConnectionFailure.fromException(exception: exception);
      expect(failure.message, exception.toString());
    });
  });
}


import 'package:flutter_test/flutter_test.dart';
import 'package:insect_detection_app/src/core/core.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mocktail/mocktail.dart';

class MockInternetConnectionChecker extends Mock
    implements InternetConnectionChecker {}

void main() {
  late NetworkInfoImpl networkInfo;
  late MockInternetConnectionChecker mockInternetConnectionChecker;

  setUp(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(mockInternetConnectionChecker);
  });

  group('isConnected', () {
    test('should return true when hasConnection is true', () async {
      // Arrange
      when(() => mockInternetConnectionChecker.hasConnection)
          .thenAnswer((_) async => true);

      // Act
      final isConnected = await networkInfo.isConnected;

      // Assert
      expect(isConnected, true);
    });

    test('should return false when hasConnection is false', () async {
      // Arrange
      when(() => mockInternetConnectionChecker.hasConnection)
          .thenAnswer((_) async => false);

      // Act
      final isConnected = await networkInfo.isConnected;

      // Assert
      expect(isConnected, false);
    });
  });
}

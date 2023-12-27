import 'package:insect_detection_app/src/core/core.dart';

// [Future] UseCase
abstract class UseCaseWithParams<T, Params> {
  ResultFuture<T> call(Params params);
}

// [Future] NoParamUseCase
abstract class UseCaseWithNoParams<T> {
  ResultFuture<T> call();
}

// [Streams] StreamUseCase
abstract class StreamUseCase<T, Params> {
  ResultStream<T> call(Params params);
}

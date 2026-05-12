import '../error/failures/app_failures.dart';

sealed class OperationResult<T> {}

class OperationSuccess<T> extends OperationResult<T> {
  final T data;
  final Failure? warning;

  OperationSuccess(this.data, {this.warning});
}

class OperationFailure<T> extends OperationResult<T> {
  final Failure failure;

  OperationFailure(this.failure);
}

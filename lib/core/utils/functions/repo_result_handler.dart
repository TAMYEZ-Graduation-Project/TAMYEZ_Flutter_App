import 'dart:async';

import '../../error/mappers/exceptions_mapper.dart' show ExceptionHandling;
import '../../execution/operation_result.dart';

Future<OperationResult<T>> repoResultHandler<T>(
  FutureOr<T> Function() handle,
) async {
  try {
    final T data = await handle();
    return OperationSuccess<T>(data);
  } catch (e) {
    return OperationFailure<T>(ExceptionHandling.mapExceptionsToFailures(e));
  }
}

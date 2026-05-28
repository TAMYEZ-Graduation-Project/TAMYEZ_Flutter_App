import 'package:equatable/equatable.dart' show EquatableMixin;

import '../../error/failures/app_failures.dart';

sealed class UiResult<T> with EquatableMixin {
  const UiResult();
}

class Initial<T> extends UiResult<T> {
  const Initial();

  @override
  List<Object?> get props => [];
}

class Loading<T> extends UiResult<T> {
  const Loading();

  @override
  List<Object?> get props => [];
}

class Success<T> extends UiResult<T> {
  final T data;

  const Success(this.data);

  @override
  List<Object?> get props => [data];
}

class Error<T> extends UiResult<T> {
  final Failure failure;

  const Error(this.failure);

  @override
  List<Object?> get props => [failure];
}

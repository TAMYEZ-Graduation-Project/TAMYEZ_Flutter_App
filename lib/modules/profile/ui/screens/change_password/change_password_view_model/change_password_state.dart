import 'package:equatable/equatable.dart';

import '../../../../../../core/presentation/result/ui_result.dart';

class ChangePasswordState extends Equatable {
  final UiResult<void> changePasswordResult;

  const ChangePasswordState({this.changePasswordResult = const Initial()});

  @override
  List<Object?> get props => [changePasswordResult];

  ChangePasswordState copyWith({UiResult<void>? changePasswordResult}) {
    return ChangePasswordState(
      changePasswordResult: changePasswordResult ?? this.changePasswordResult,
    );
  }
}

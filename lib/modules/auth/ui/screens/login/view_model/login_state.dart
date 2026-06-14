import 'package:equatable/equatable.dart';

import '../../../../../../core/presentation/result/ui_result.dart';

class LoginState with EquatableMixin {
  final UiResult<void> systemLoginResult;
  final UiResult<void> googleLoginResult;

  const LoginState({
    this.systemLoginResult = const Initial(),
    this.googleLoginResult = const Initial(),
  });

  LoginState copyWith({
    UiResult<void>? systemLoginResult,
    UiResult<void>? googleLoginResult,
  }) {
    return LoginState(
      systemLoginResult: systemLoginResult ?? this.systemLoginResult,
      googleLoginResult: googleLoginResult ?? this.googleLoginResult,
    );
  }

  @override
  List<Object?> get props => [systemLoginResult, googleLoginResult];
}

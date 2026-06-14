import 'package:equatable/equatable.dart' show EquatableMixin;

import '../../../../../../core/presentation/result/ui_result.dart';

enum GenderEnum {
  male(value: 'Male'),
  female(value: 'Female');

  final String value;

  const GenderEnum({required this.value});
}

class SignUpState with EquatableMixin {
  final UiResult<void> systemSignUpResult;
  final UiResult<void> googleSignUpResult;

  const SignUpState({
    this.systemSignUpResult = const Initial(),
    this.googleSignUpResult = const Initial(),
  });

  SignUpState copyWith({
    UiResult<void>? systemSignUpResult,
    UiResult<void>? googleSignUpResult,
  }) {
    return SignUpState(
      systemSignUpResult: systemSignUpResult ?? this.systemSignUpResult,
      googleSignUpResult: googleSignUpResult ?? this.googleSignUpResult,
    );
  }

  @override
  List<Object?> get props => [systemSignUpResult, googleSignUpResult];
}

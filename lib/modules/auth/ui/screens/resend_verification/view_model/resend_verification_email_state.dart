import 'package:equatable/equatable.dart';

import '../../../../../../core/presentation/result/ui_result.dart';

class ResendVerificationEmailState with EquatableMixin {
  final UiResult<void> resendVerificationEmailResult;

  const ResendVerificationEmailState({
    this.resendVerificationEmailResult = const Initial(),
  });

  @override
  List<Object?> get props => [resendVerificationEmailResult];

  ResendVerificationEmailState copyWith({
    UiResult<void>? resendVerificationEmailResult,
  }) {
    return ResendVerificationEmailState(
      resendVerificationEmailResult:
          resendVerificationEmailResult ?? this.resendVerificationEmailResult,
    );
  }
}

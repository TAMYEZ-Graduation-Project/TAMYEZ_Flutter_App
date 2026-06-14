import 'package:equatable/equatable.dart' show EquatableMixin;

import '../../../../../../core/presentation/result/ui_result.dart';

class ForgetPasswordState with EquatableMixin {
  final String? userEmail;
  final UiResult<void> forgetPasswordResult;
  final UiResult<void> resendOtpCodeResult;
  final UiResult<void> verifyCodeResult;
  final UiResult<void> resetPasswordResult;
  final int timeRemainingForNextResend;

  const ForgetPasswordState({
    this.userEmail,
    this.forgetPasswordResult = const Initial(),
    this.resendOtpCodeResult = const Initial(),
    this.verifyCodeResult = const Initial(),
    this.resetPasswordResult = const Initial(),
    this.timeRemainingForNextResend = 0,
  });

  @override
  List<Object?> get props => [
    userEmail,
    resendOtpCodeResult,
    forgetPasswordResult,
    verifyCodeResult,
    resetPasswordResult,
    timeRemainingForNextResend,
  ];

  ForgetPasswordState copyWith({
    String? userEmail,
    UiResult<void>? forgetPasswordResult,
    UiResult<void>? resendOtpCodeResult,
    UiResult<void>? verifyCodeResult,
    UiResult<void>? resetPasswordResult,
    int? timeRemainingForNextResend,
  }) {
    return ForgetPasswordState(
      userEmail: userEmail ?? this.userEmail,
      forgetPasswordResult: forgetPasswordResult ?? this.forgetPasswordResult,
      resendOtpCodeResult: resendOtpCodeResult ?? this.resendOtpCodeResult,
      verifyCodeResult: verifyCodeResult ?? this.verifyCodeResult,
      resetPasswordResult: resetPasswordResult ?? this.resetPasswordResult,
      timeRemainingForNextResend:
          timeRemainingForNextResend ?? this.timeRemainingForNextResend,
    );
  }
}

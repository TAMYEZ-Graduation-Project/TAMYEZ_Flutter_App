import 'package:injectable/injectable.dart';

import '../../../../../../core/execution/operation_result.dart'
    show OperationFailure, OperationResult, OperationSuccess;
import '../../../../../../core/presentation/bases/base_cubit.dart';
import '../../../../../../core/presentation/mixins/effects_handling_mixin.dart'
    show NavigationTypeEnum;
import '../../../../../../core/presentation/result/ui_effect.dart';
import '../../../../../../core/presentation/result/ui_result.dart';
import '../../../../../../core/presentation/routing/defined_routes.dart'
    show DefinedRoutes;
import '../../../../../../core/success/success_enum.dart';
import '../../../../../../core/utils/counter/count_down_utility.dart';
import '../../../../domain/entities/reset_password_params.dart'
    show ResetPasswordParams;
import '../../../../domain/entities/user_email_params.dart';
import '../../../../domain/entities/verify_code_params.dart';
import '../../../../domain/use_case/forget_password_use_case.dart';
import '../../../../domain/use_case/reset_password_use_case.dart'
    show ResetPasswordUseCase;
import '../../../../domain/use_case/verify_code_use_case.dart'
    show VerifyCodeUseCase;
import 'forget_password_intent.dart';
import 'forget_password_state.dart';

@injectable
class ForgetPasswordViewModel extends BaseCubit<ForgetPasswordState, UiEffect> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final VerifyCodeUseCase _verifyCodeUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final CountDownUtility _countDownUtility;

  ForgetPasswordViewModel(
    this._forgetPasswordUseCase,
    this._verifyCodeUseCase,
    this._resetPasswordUseCase,
    this._countDownUtility,
  ) : super(const ForgetPasswordState());

  Future<void> doIntent(ForgetPasswordIntent intent) async {
    switch (intent) {
      case SubmitEmailIntent():
        await _submitEmail(intent: intent);
        break;
      case VerifyCodeIntent():
        await _verifyCode(intent: intent);
        break;
      case ResetPasswordIntent():
        await _resetPassword(intent: intent);
      case ResendOtpCodeIntent():
        await _resendOtpCode();
      case PageNavigationIntent():
        emitEffect(PageNavigationEffect(page: intent.page));
    }
  }

  Future<void> _submitEmail({required SubmitEmailIntent intent}) async {
    emit(state.copyWith(forgetPasswordResult: const Loading()));
    final OperationResult<void> result = await _forgetPasswordUseCase.call(
      params: UserEmailParams(email: intent.email),
    );

    switch (result) {
      case OperationSuccess<void>():
        emit(
          state.copyWith(
            userEmail: intent.email,
            forgetPasswordResult: const Success(null),
          ),
        );
        emitEffect(
          const DisplaySuccessEffect(
            success: SuccessEnum.forgetPasswordEmailSent,
          ),
        );
        emitEffect(const PageNavigationEffect(page: 1));
      case OperationFailure<void>():
        emit(state.copyWith(forgetPasswordResult: Error(result.failure)));
        emitEffect(DisplayErrorEffect(failure: result.failure));
    }
  }

  Future<void> _resendOtpCode() async {
    if (_countDownUtility.isCountdownRunning) return;
    emit(state.copyWith(resendOtpCodeResult: const Loading()));
    final OperationResult<void> result = await _forgetPasswordUseCase.call(
      params: UserEmailParams(email: state.userEmail!),
    );

    switch (result) {
      case OperationSuccess<void>():
        emitEffect(
          const DisplaySuccessEffect(success: SuccessEnum.otpResentSuccess),
        );
        _countDownUtility.startCountdown(
          seconds: 40,
          onTick: (remaining) {
            emit(
              state.copyWith(
                resendOtpCodeResult: const Success(null),
                timeRemainingForNextResend: remaining,
              ),
            );
          },
          onFinished: () {
            emit(state.copyWith(timeRemainingForNextResend: 0));
          },
        );
      case OperationFailure<void>():
        emit(state.copyWith(resendOtpCodeResult: Error(result.failure)));
        emitEffect(DisplayErrorEffect(failure: result.failure));
    }
  }

  Future<void> _verifyCode({required VerifyCodeIntent intent}) async {
    emit(state.copyWith(verifyCodeResult: const Loading()));
    final OperationResult<void> result = await _verifyCodeUseCase.call(
      params: VerifyCodeParams(email: state.userEmail!, otp: intent.code),
    );

    switch (result) {
      case OperationSuccess<void>():
        emit(state.copyWith(verifyCodeResult: const Success(null)));
        emitEffect(
          const DisplaySuccessEffect(success: SuccessEnum.otpVerifiedSuccess),
        );
        emitEffect(const PageNavigationEffect(page: 2));
      case OperationFailure<void>():
        emit(state.copyWith(verifyCodeResult: Error(result.failure)));
        emitEffect(DisplayErrorEffect(failure: result.failure));
    }
  }

  Future<void> _resetPassword({required ResetPasswordIntent intent}) async {
    emit(state.copyWith(resetPasswordResult: const Loading()));
    final OperationResult<void> result = await _resetPasswordUseCase.call(
      params: ResetPasswordParams(
        email: state.userEmail!,
        password: intent.password,
        confirmPassword: intent.confirmPassword,
      ),
    );

    switch (result) {
      case OperationSuccess<void>():
        emit(state.copyWith(resetPasswordResult: const Success(null)));
        emitEffect(
          const DisplaySuccessEffect(success: SuccessEnum.resetPasswordSuccess),
        );
        emitEffect(
          const NavigateEffect(
            route: DefinedRoutes.loginRoute,
            navigationType: NavigationTypeEnum.pushNamedAndRemoveUntil,
          ),
        );
      case OperationFailure<void>():
        emit(state.copyWith(resetPasswordResult: Error(result.failure)));
        emitEffect(DisplayErrorEffect(failure: result.failure));
    }
  }
}

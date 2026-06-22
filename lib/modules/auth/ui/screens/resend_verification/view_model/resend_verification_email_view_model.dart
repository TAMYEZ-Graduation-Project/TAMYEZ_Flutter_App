import 'package:injectable/injectable.dart' show injectable;

import '../../../../../../core/execution/operation_result.dart'
    show OperationResult, OperationSuccess, OperationFailure;
import '../../../../../../core/presentation/bases/base_cubit.dart';
import '../../../../../../core/presentation/mixins/effects_handling_mixin.dart';
import '../../../../../../core/presentation/result/ui_effect.dart';
import '../../../../../../core/presentation/result/ui_result.dart';
import '../../../../../../core/presentation/routing/defined_routes.dart';
import '../../../../../../core/success/success_enum.dart' show SuccessEnum;
import '../../../../domain/entities/user_email_params.dart';
import '../../../../domain/use_case/resend_email_verification_use_case.dart';
import 'resend_verification_email_event.dart';
import 'resend_verification_email_state.dart';

@injectable
class ResendVerificationEmailViewModel
    extends BaseCubit<ResendVerificationEmailState, UiEffect> {
  final ResendEmailVerificationUseCase _resendEmailVerificationUseCase;

  ResendVerificationEmailViewModel(this._resendEmailVerificationUseCase)
    : super(const ResendVerificationEmailState());

  Future<void> doIntent(ResendVerificationEmailIntent intent) async {
    switch (intent) {
      case ResendOtpIntent():
        await _resendOtp(intent);
    }
  }

  Future<void> _resendOtp(ResendOtpIntent intent) async {
    emit(state.copyWith(resendVerificationEmailResult: const Loading()));
    final OperationResult<void> result = await _resendEmailVerificationUseCase
        .call(params: UserEmailParams(email: intent.email));

    switch (result) {
      case OperationSuccess<void>():
        emit(
          state.copyWith(resendVerificationEmailResult: const Success(null)),
        );
        emitEffect(
            const DisplaySuccessEffect(success: SuccessEnum.otpResentSuccess));
        emitEffect(
          const NavigateEffect(
            route: DefinedRoutes.previousRoute,
            navigationType: NavigationTypeEnum.pop,
          ),
        );
      case OperationFailure<void>():
        emit(
          state.copyWith(resendVerificationEmailResult: Error(result.failure)),
        );
        emitEffect(DisplayErrorEffect(failure: result.failure));
    }
  }
}

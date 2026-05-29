import 'package:injectable/injectable.dart';

import '../../../../../../core/execution/operation_result.dart';
import '../../../../../../core/presentation/bases/base_cubit.dart';
import '../../../../../../core/presentation/result/ui_effect.dart';
import '../../../../../../core/presentation/result/ui_result.dart';
import '../../../../../../core/success/success_enum.dart';
import '../../../../domain/use_case/google_login_use_case.dart'
    show GoogleLoginUseCase;
import 'sign_up_intent.dart';
import 'sign_up_state.dart';

@injectable
class SignUpViewModel extends BaseCubit<SignUpState, UiEffect> {
  final GoogleLoginUseCase _googleLoginUseCase;

  SignUpViewModel(this._googleLoginUseCase) : super(const SignUpState());

  Future<void> doIntent(SignUpIntent intent) async {
    switch (intent) {
      case GoogleSignUpIntent():
        await _googleSignUp();
        break;
    }
  }

  Future<void> _googleSignUp() async {
    emit(state.copyWith(googleSignUpResult: const Loading()));
    final OperationResult<void> result = await _googleLoginUseCase.call();

    switch (result) {
      case OperationSuccess<void>():
        emit(state.copyWith(googleSignUpResult: const Success(null)));
        emitEffect(const SuccessEffect(success: SuccessEnum.loginSuccess));
      case OperationFailure<void>():
        emit(state.copyWith(googleSignUpResult: Error(result.failure)));
        emitEffect(DisplayErrorEffect(failure: result.failure));
    }
  }
}

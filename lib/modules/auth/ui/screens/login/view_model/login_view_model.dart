import 'package:injectable/injectable.dart';

import '../../../../../../core/execution/operation_result.dart';
import '../../../../../../core/presentation/bases/base_cubit.dart';
import '../../../../../../core/presentation/result/ui_effect.dart';
import '../../../../../../core/presentation/result/ui_result.dart';
import '../../../../../../core/success/success_enum.dart';
import '../../../../domain/use_case/google_login_use_case.dart'
    show GoogleLoginUseCase;
import 'login_intent.dart';
import 'login_state.dart';

@injectable
class LoginViewModel extends BaseCubit<LoginState, UiEffect> {
  final GoogleLoginUseCase _googleLoginUseCase;

  LoginViewModel(this._googleLoginUseCase) : super(const LoginState());

  Future<void> doIntent(LoginIntent intent) async {
    switch (intent) {
      case GoogleLoginIntent():
        await _googleLogin();
        break;
    }
  }

  Future<void> _googleLogin() async {
    emit(state.copyWith(googleLoginResult: const Loading()));
    final OperationResult<void> result = await _googleLoginUseCase.call();

    switch (result) {
      case OperationSuccess<void>():
        emit(state.copyWith(googleLoginResult: const Success(null)));
        emitEffect(const SuccessEffect(success: SuccessEnum.loginSuccess));
      case OperationFailure<void>():
        emit(state.copyWith(googleLoginResult: Error(result.failure)));
        emitEffect(DisplayErrorEffect(failure: result.failure));
    }
  }
}

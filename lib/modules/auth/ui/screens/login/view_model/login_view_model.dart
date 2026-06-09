import 'package:injectable/injectable.dart';

import '../../../../../../core/execution/operation_result.dart';
import '../../../../../../core/presentation/bases/base_cubit.dart';
import '../../../../../../core/presentation/result/ui_effect.dart';
import '../../../../../../core/presentation/result/ui_result.dart';
import '../../../../../../core/success/success_enum.dart';
import '../../../../domain/entities/login_params.dart';
import '../../../../domain/entities/login_response_entity.dart';
import '../../../../domain/use_case/gmail_login_use_case.dart';
import '../../../../domain/use_case/login_use_case.dart';
import 'login_intent.dart';
import 'login_state.dart';

@injectable
class LoginViewModel extends BaseCubit<LoginState, UiEffect> {
  final LoginUseCase _loginUseCase;
  final GmailLoginUseCase _gmailLoginUseCase;

  LoginViewModel(this._loginUseCase, this._gmailLoginUseCase)
    : super(const LoginState());

  Future<void> doIntent(LoginIntent intent) async {
    switch (intent) {
      case SystemLoginIntent():
        await _systemLogin(intent: intent);
        break;
      case GmailLoginIntent():
        await _gmailLogin();
    }
  }

  Future<void> _systemLogin({required SystemLoginIntent intent}) async {
    emit(state.copyWith(systemLoginResult: const Loading()));
    final OperationResult<LoginResponseEntity> result = await _loginUseCase
        .call(
          params: LoginParams(email: intent.email, password: intent.password),
        );

    emit(state.copyWith(systemLoginResult: const Initial()));

    switch (result) {
      case OperationSuccess<LoginResponseEntity>():
        emitEffect(const SuccessEffect(success: SuccessEnum.loginSuccess));
      case OperationFailure<LoginResponseEntity>():
        emitEffect(DisplayErrorEffect(failure: result.failure));
    }
  }

  Future<void> _gmailLogin() async {
    emit(state.copyWith(googleLoginResult: const Loading()));
    final OperationResult<LoginResponseEntity> result = await _gmailLoginUseCase
        .call();

    emit(state.copyWith(googleLoginResult: const Initial()));

    switch (result) {
      case OperationSuccess<LoginResponseEntity>():
        emitEffect(const SuccessEffect(success: SuccessEnum.loginSuccess));
      case OperationFailure<LoginResponseEntity>():
        emitEffect(DisplayErrorEffect(failure: result.failure));
    }
  }
}

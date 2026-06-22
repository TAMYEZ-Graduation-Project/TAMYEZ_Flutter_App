import 'package:injectable/injectable.dart';

import '../../../../../../core/bootstrap/app_initializer.dart';
import '../../../../../../core/execution/operation_result.dart';
import '../../../../../../core/presentation/bases/base_cubit.dart';
import '../../../../../../core/presentation/mixins/effects_handling_mixin.dart'
    show NavigationTypeEnum;
import '../../../../../../core/presentation/result/ui_effect.dart';
import '../../../../../../core/presentation/result/ui_result.dart';
import '../../../../../../core/presentation/routing/defined_routes.dart'
    show DefinedRoutes;
import '../../../../../../core/success/success_enum.dart';
import '../../../../../../core/utils/functions/user_completed_assessment.dart'
    show userCompletedAssessment;
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
  final AppInitializer _appInitializer;

  LoginViewModel(
    this._loginUseCase,
    this._gmailLoginUseCase,
    this._appInitializer,
  ) : super(const LoginState());

  Future<void> doIntent(LoginIntent intent) async {
    switch (intent) {
      case SystemLoginIntent():
        await _systemLogin(intent: intent);
        break;
      case GmailLoginIntent():
        await _gmailLogin(intent: intent);
    }
  }

  Future<void> _systemLogin({required SystemLoginIntent intent}) async {
    emit(state.copyWith(systemLoginResult: const Loading()));
    final OperationResult<LoginResponseEntity> result = await _loginUseCase
        .call(
          params: LoginParams(email: intent.email, password: intent.password),
          rememberMe: intent.rememberMe,
        );

    emit(state.copyWith(systemLoginResult: const Initial()));

    switch (result) {
      case OperationSuccess<LoginResponseEntity>():
        _appInitializer.initAuthAndUserProvider(result.data.body);
        emit(state.copyWith(systemLoginResult: const Success(null)));
        emitEffect(
            const DisplaySuccessEffect(success: SuccessEnum.loginSuccess));
        emitEffect(
          NavigateEffect(
            route: userCompletedAssessment(result.data.body.user)
                ? DefinedRoutes.homeRoute
                : DefinedRoutes.discoverYourPotentialRoute,
            navigationType: NavigationTypeEnum.pushNamedAndRemoveUntil,
          ),
        );
      case OperationFailure<LoginResponseEntity>():
        emit(state.copyWith(systemLoginResult: Error(result.failure)));
        emitEffect(DisplayErrorEffect(failure: result.failure));
    }
  }

  Future<void> _gmailLogin({required GmailLoginIntent intent}) async {
    emit(state.copyWith(googleLoginResult: const Loading()));
    final OperationResult<LoginResponseEntity> result = await _gmailLoginUseCase
        .call(rememberMe: intent.rememberMe);

    switch (result) {
      case OperationSuccess<LoginResponseEntity>():
        _appInitializer.initAuthAndUserProvider(result.data.body);
        emit(state.copyWith(googleLoginResult: const Success(null)));
        emitEffect(
            const DisplaySuccessEffect(success: SuccessEnum.loginSuccess));
        emitEffect(
          const NavigateEffect(
            route: DefinedRoutes.homeRoute,
            navigationType: NavigationTypeEnum.pushNamedAndRemoveUntil,
          ),
        );
      case OperationFailure<LoginResponseEntity>():
        emit(state.copyWith(googleLoginResult: Error(result.failure)));
        emitEffect(DisplayErrorEffect(failure: result.failure));
    }
  }
}

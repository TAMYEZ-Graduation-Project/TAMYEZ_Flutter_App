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
import '../../../../domain/entities/login_response_entity.dart'
    show LoginResponseEntity;
import '../../../../domain/entities/sign_up_params.dart';
import '../../../../domain/entities/sign_up_response_entity.dart';
import '../../../../domain/use_case/gmail_sign_up_use_case.dart';
import '../../../../domain/use_case/sign_up_use_case.dart';
import 'sign_up_intent.dart';
import 'sign_up_state.dart';

@injectable
class SignUpViewModel extends BaseCubit<SignUpState, UiEffect> {
  final SignUpUseCase _signUpUseCase;
  final GmailSignUpUseCase _gmailSignUpUseCase;
  final AppInitializer _appInitializer;

  SignUpViewModel(
    this._signUpUseCase,
    this._gmailSignUpUseCase,
    this._appInitializer,
  ) : super(const SignUpState());

  Future<void> doIntent(SignUpIntent intent) async {
    switch (intent) {
      case SystemSignUpIntent():
        await _systemSignUp(intent: intent);
        break;
      case GoogleSignUpIntent():
        await _gmailSignUp();
        break;
    }
  }

  Future<void> _systemSignUp({required SystemSignUpIntent intent}) async {
    emit(state.copyWith(systemSignUpResult: const Loading()));
    final OperationResult<SignUpResponseEntity> result = await _signUpUseCase
        .call(
          params: SignUpParams(
            fullName: intent.fullName,
            email: intent.email,
            password: intent.password,
            confirmPassword: intent.confirmPassword,
            gender: intent.gender,
            phoneNumber: intent.phone,
          ),
        );

    switch (result) {
      case OperationSuccess<SignUpResponseEntity>():
        emit(state.copyWith(systemSignUpResult: const Success(null)));
        emitEffect(
          const DisplaySuccessEffect(success: SuccessEnum.signUpSuccess),
        );
        emitEffect(
          const NavigateEffect(
            route: DefinedRoutes.loginRoute,
            navigationType: NavigationTypeEnum.pop,
          ),
        );
      case OperationFailure<SignUpResponseEntity>():
        emit(state.copyWith(systemSignUpResult: Error(result.failure)));
        emitEffect(DisplayErrorEffect(failure: result.failure));
    }
  }

  Future<void> _gmailSignUp() async {
    emit(state.copyWith(googleSignUpResult: const Loading()));
    final OperationResult<LoginResponseEntity> result =
        await _gmailSignUpUseCase.call();
    emit(state.copyWith(googleSignUpResult: const Initial()));

    switch (result) {
      case OperationSuccess<LoginResponseEntity>():
        _appInitializer.initAuthAndUserProvider(session: result.data.body);
        emit(state.copyWith(googleSignUpResult: const Success(null)));
        emitEffect(
          const DisplaySuccessEffect(success: SuccessEnum.loginSuccess),
        );
        emitEffect(
          const NavigateEffect(
            route: DefinedRoutes.homeRoute,
            navigationType: NavigationTypeEnum.pushNamedAndRemoveUntil,
          ),
        );
      case OperationFailure<LoginResponseEntity>():
        emit(state.copyWith(googleSignUpResult: Error(result.failure)));
        emitEffect(DisplayErrorEffect(failure: result.failure));
    }
  }
}

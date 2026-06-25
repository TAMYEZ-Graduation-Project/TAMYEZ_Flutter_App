import 'package:injectable/injectable.dart';

import '../../../../../../core/auth_providers/auth_provider.dart';
import '../../../../../../core/auth_providers/user_provider.dart';
import '../../../../../../core/execution/operation_result.dart';
import '../../../../../../core/presentation/bases/base_cubit.dart';
import '../../../../../../core/presentation/mixins/effects_handling_mixin.dart';
import '../../../../../../core/presentation/result/ui_effect.dart';
import '../../../../../../core/presentation/result/ui_result.dart';
import '../../../../../../core/presentation/routing/defined_routes.dart';
import '../../../../../../core/success/success_enum.dart';
import '../../../../domain/entities/change_password_params.dart';
import '../../../../domain/use_cases/change_password_use_case.dart';
import 'change_password_intent.dart';
import 'change_password_state.dart';

@injectable
class ChangePasswordViewModel extends BaseCubit<ChangePasswordState, UiEffect> {
  final ChangePasswordUseCase _changePasswordUseCase;
  final UserProvider _userProvider;
  final AuthProvider _authProvider;

  ChangePasswordViewModel(
    this._changePasswordUseCase,
    this._userProvider,
    this._authProvider,
  ) : super(const ChangePasswordState());

  Future<void> doIntent(ChangePasswordIntent intent) async {
    switch (intent) {
      case ChangeUserPasswordIntent():
        await _changeUserPassword(intent);
    }
  }

  Future<void> _changeUserPassword(ChangeUserPasswordIntent intent) async {
    emit(state.copyWith(changePasswordResult: const Loading()));
    final version = _userProvider.user!.v;
    final result = await _changePasswordUseCase(
      params: ChangePasswordParams(
        currentPassword: intent.currentPassword,
        newPassword: intent.newPassword,
        confirmPassword: intent.confirmPassword,
        v: version,
      ),
      userRemembered: _authProvider.isUserRemembered,
    );
    switch (result) {
      case OperationSuccess<void>():
        emit(state.copyWith(changePasswordResult: const Success(null)));
        _userProvider.setUser(
          user: _userProvider.user!.copyWith(v: version + 1),
        );
        emitEffect(
          const DisplaySuccessEffect(
            success: SuccessEnum.changePasswordSuccess,
          ),
        );
        emitEffect(
          const NavigateEffect(
            route: DefinedRoutes.previousRoute,
            navigationType: NavigationTypeEnum.pop,
          ),
        );
        break;
      case OperationFailure<void>():
        emit(state.copyWith(changePasswordResult: Error(result.failure)));
        emitEffect(DisplayErrorEffect(failure: result.failure));
        break;
    }
  }
}

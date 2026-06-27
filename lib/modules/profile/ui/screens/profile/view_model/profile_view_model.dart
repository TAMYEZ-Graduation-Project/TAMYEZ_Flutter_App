import 'package:injectable/injectable.dart';

import '../../../../../../core/auth_providers/user_provider.dart';
import '../../../../../../core/bootstrap/app_initializer.dart';
import '../../../../../../core/entities/user_entity.dart';
import '../../../../../../core/execution/operation_result.dart';
import '../../../../../../core/presentation/bases/base_cubit.dart';
import '../../../../../../core/presentation/mixins/effects_handling_mixin.dart';
import '../../../../../../core/presentation/result/ui_effect.dart';
import '../../../../../../core/presentation/result/ui_result.dart';
import '../../../../../../core/presentation/routing/defined_routes.dart';
import '../../../../../../core/success/success_enum.dart';
import '../../../../../../core/utils/functions/safe_print.dart';
import '../../../../domain/use_cases/delete_account_use_case.dart';
import '../../../../domain/use_cases/disable_notifications_use_case.dart';
import '../../../../domain/use_cases/enable_notifications_use_case.dart';
import '../../../../domain/use_cases/logout_use_case.dart';
import '../../../../domain/use_cases/sync_profile_use_case.dart';
import 'profile_intent.dart';
import 'profile_state.dart';

@injectable
class ProfileViewModel extends BaseCubit<ProfileState, UiEffect> {
  final SyncProfileUseCase _syncProfileUseCase;
  final LogoutUseCase _logoutUseCase;
  final DeleteAccountUseCase _deleteAccountUseCase;
  final UserProvider _userProvider;
  final AppInitializer _appInitializer;
  final EnableNotificationsUseCase _enableNotificationsUseCase;
  final DisableNotificationsUseCase _disableNotificationsUseCase;

  ProfileViewModel(
    this._logoutUseCase,
    this._deleteAccountUseCase,
    this._syncProfileUseCase,
    this._userProvider,
    this._appInitializer,
    this._enableNotificationsUseCase,
    this._disableNotificationsUseCase,
  ) : super(const ProfileState()) {
    _init();
  }

  Future<void> doIntent(ProfileIntent intent) async {
    switch (intent) {
      case GetUserProfileIntent():
        await _getUserProfile();
      case LogoutIntent():
        await _logOut();
      case DeleteAccountIntent():
        await _deleteAccount();
      case EnableNotificationsIntent():
        await _enableNotifications(replaceDeviceId: intent.replaceDeviceId);
      case DisableNotificationsIntent():
        await _disableNotifications();
    }
  }

  Future<void> _getUserProfile() async {
    emit(state.copyWith(userProfileResult: const Loading()));
    final result = await _syncProfileUseCase.call();

    switch (result) {
      case OperationSuccess<UserEntity>():
        _userProvider.setUser(user: result.data);
        emit(state.copyWith(userProfileResult: Success(result.data)));
        if (result.warning != null) {
          emitEffect(DisplayWarningEffect(failure: result.warning!));
        }
      case OperationFailure<UserEntity>():
        emit(state.copyWith(userProfileResult: Error(result.failure)));
    }
  }

  void _init() {
    final user = _userProvider.user;
    emit(state.copyWith(userProfileResult: Success(user!)));

    _userProvider.addListener(_onUserChanged);
  }

  void _onUserChanged() {
    if (_userProvider.user != null) {
      emit(state.copyWith(userProfileResult: Success(_userProvider.user!)));
    }
  }

  Future<void> _logOut() async {
    emit(state.copyWith(logoutResult: const Loading()));
    final result = await _logoutUseCase.call(
      notificationsEnabled: _userProvider.notificationsEnabled,
    );
    switch (result) {
      case OperationSuccess<void>():
        emit(state.copyWith(logoutResult: const Success(null)));
        _appInitializer.clearAuthAndUserProvider();
        emitEffect(
          const NavigateEffect(
            route: DefinedRoutes.loginRoute,
            navigationType: NavigationTypeEnum.pushNamedAndRemoveUntil,
          ),
        );
      case OperationFailure<void>():
        emit(state.copyWith(logoutResult: Error(result.failure)));
        emitEffect(DisplayErrorEffect(failure: result.failure));
    }
  }

  Future<void> _deleteAccount() async {
    emit(state.copyWith(deleteAccountResult: const Loading()));
    if (_userProvider.user == null) return;
    final result = await _deleteAccountUseCase.call(
      version: _userProvider.user!.v.toInt(),
    );
    switch (result) {
      case OperationSuccess<void>():
        emit(state.copyWith(deleteAccountResult: const Success(null)));
        _appInitializer.clearAuthAndUserProvider();
        emitEffect(
          const DisplaySuccessEffect(
            success: SuccessEnum.accountDeletedSuccess,
          ),
        );
        emitEffect(
          const NavigateEffect(
            route: DefinedRoutes.loginRoute,
            navigationType: NavigationTypeEnum.pushNamedAndRemoveUntil,
          ),
        );
      case OperationFailure<void>():
        emit(state.copyWith(deleteAccountResult: Error(result.failure)));
        emitEffect(DisplayErrorEffect(failure: result.failure));
    }
  }

  Future<void> _enableNotifications({String? replaceDeviceId}) async {
    emit(state.copyWith(enableNotificationsResult: const Loading()));
    final result = await _enableNotificationsUseCase.call(
      replaceDeviceId: replaceDeviceId,
    );
    switch (result) {
      case OperationSuccess<void>():
        emit(state.copyWith(enableNotificationsResult: const Success(null)));
        _userProvider.setNotificationsEnabled(notificationsEnabled: true);
        emitEffect(
          const DisplaySuccessEffect(
            success: SuccessEnum.notificationsEnabledSuccess,
          ),
        );
      case OperationFailure<void>():
        emit(state.copyWith(enableNotificationsResult: Error(result.failure)));
        safePrint('Failure type: ${result.failure.runtimeType}');
        emitEffect(DisplayErrorEffect(failure: result.failure));
    }
  }

  Future<void> _disableNotifications() async {
    emit(state.copyWith(disableNotificationsResult: const Loading()));
    final result = await _disableNotificationsUseCase.call();
    switch (result) {
      case OperationSuccess<void>():
        emit(state.copyWith(disableNotificationsResult: const Success(null)));
        _userProvider.setNotificationsEnabled(notificationsEnabled: false);
        emitEffect(
          const DisplaySuccessEffect(
            success: SuccessEnum.notificationsDisabledSuccess,
          ),
        );
      case OperationFailure<void>():
        emit(state.copyWith(disableNotificationsResult: Error(result.failure)));
        emitEffect(DisplayErrorEffect(failure: result.failure));
    }
  }

  @override
  Future<void> close() {
    _userProvider.removeListener(_onUserChanged);
    return super.close();
  }
}

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
import '../../../../domain/use_cases/sync_profile_use_case.dart';
import 'profile_intent.dart';
import 'profile_state.dart';

@injectable
class ProfileViewModel extends BaseCubit<ProfileState, UiEffect> {
  final SyncProfileUseCase _syncProfileUseCase;
  final UserProvider _userProvider;
  final AppInitializer _appInitializer;

  ProfileViewModel(
    this._syncProfileUseCase,
    this._userProvider,
    this._appInitializer,
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
    emit(state.copyWith(userProfileResult: Success(_userProvider.user!)));
  }

  Future<void> _logOut() async {
    emit(state.copyWith(userProfileResult: const Loading()));
    final result = await _syncProfileUseCase.call();
    switch (result) {
      case OperationSuccess<UserEntity>():
        emit(state.copyWith(userProfileResult: Success(result.data)));
        _appInitializer.clearAuthAndUserProvider();
        emitEffect(
          const NavigateEffect(
            route: DefinedRoutes.loginRoute,
            navigationType: NavigationTypeEnum.pushNamedAndRemoveUntil,
          ),
        );
      case OperationFailure<UserEntity>():
        emit(state.copyWith(userProfileResult: Error(result.failure)));
        emitEffect(DisplayErrorEffect(failure: result.failure));
    }
  }

  Future<void> _deleteAccount() async {
    emit(state.copyWith(deleteAccountResult: const Loading()));
    final result = await _syncProfileUseCase.call();
    switch (result) {
      case OperationSuccess<UserEntity>():
        emit(state.copyWith(deleteAccountResult: const Success(null)));
        _appInitializer.clearAuthAndUserProvider();
        emitEffect(
          const NavigateEffect(
            route: DefinedRoutes.loginRoute,
            navigationType: NavigationTypeEnum.pushNamedAndRemoveUntil,
          ),
        );
      case OperationFailure<UserEntity>():
        emit(state.copyWith(deleteAccountResult: Error(result.failure)));
        emitEffect(DisplayErrorEffect(failure: result.failure));
    }
  }

  @override
  Future<void> close() {
    _userProvider.removeListener(_onUserChanged);
    return super.close();
  }
}

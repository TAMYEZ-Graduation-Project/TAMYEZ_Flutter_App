import 'package:injectable/injectable.dart';

import '../../../../../../core/auth_providers/user_provider.dart';
import '../../../../../../core/entities/user_entity.dart';
import '../../../../../../core/execution/operation_result.dart';
import '../../../../../../core/presentation/bases/base_cubit.dart';
import '../../../../../../core/presentation/result/ui_effect.dart';
import '../../../../../../core/presentation/result/ui_result.dart';
import '../../../../domain/use_cases/sync_profile_use_case.dart';
import 'profile_intent.dart';
import 'profile_state.dart';

@injectable
class ProfileViewModel extends BaseCubit<ProfileState, UiEffect> {
  final SyncProfileUseCase _syncProfileUseCase;
  final UserProvider _userProvider;

  ProfileViewModel(this._syncProfileUseCase, this._userProvider)
    : super(const ProfileState()) {
    _init();
  }

  Future<void> doIntent(ProfileIntent intent) async {
    switch (intent) {
      case GetUserProfileIntent():
        await _getUserProfile();
    }
  }

  Future<void> _getUserProfile() async {
    emit(state.copyWith(userProfileResult: const Loading()));
    final result = await _syncProfileUseCase.call();

    switch (result) {
      case OperationSuccess<UserEntity>():
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

  @override
  Future<void> close() {
    _userProvider.removeListener(_onUserChanged);
    return super.close();
  }
}

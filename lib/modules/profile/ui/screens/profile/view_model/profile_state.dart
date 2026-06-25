import 'package:equatable/equatable.dart';

import '../../../../../../core/entities/user_entity.dart';
import '../../../../../../core/presentation/result/ui_result.dart';

class ProfileState with EquatableMixin {
  final UiResult<UserEntity> userProfileResult;
  final UiResult<void> logoutResult;
  final UiResult<void> deleteAccountResult;

  const ProfileState({
    this.userProfileResult = const Initial(),
    this.logoutResult = const Initial(),
    this.deleteAccountResult = const Initial(),
  });

  @override
  List<Object?> get props => [
    userProfileResult,
    logoutResult,
    deleteAccountResult,
  ];

  ProfileState copyWith({
    UiResult<UserEntity>? userProfileResult,
    UiResult<void>? logoutResult,
    UiResult<void>? deleteAccountResult,
  }) {
    return ProfileState(
      userProfileResult: userProfileResult ?? this.userProfileResult,
      logoutResult: logoutResult ?? this.logoutResult,
      deleteAccountResult: deleteAccountResult ?? this.deleteAccountResult,
    );
  }
}

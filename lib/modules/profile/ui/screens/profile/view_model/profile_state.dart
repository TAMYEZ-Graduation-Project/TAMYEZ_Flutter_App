import 'package:equatable/equatable.dart';

import '../../../../../../core/entities/user_entity.dart';
import '../../../../../../core/presentation/result/ui_result.dart';

class ProfileState with EquatableMixin {
  final UiResult<UserEntity> userProfileResult;
  final UiResult<void> logoutResult;
  final UiResult<void> deleteAccountResult;

  final UiResult<void> enableNotificationsResult;

  final UiResult<void> disableNotificationsResult;

  const ProfileState({
    this.userProfileResult = const Initial(),
    this.logoutResult = const Initial(),
    this.deleteAccountResult = const Initial(),
    this.enableNotificationsResult = const Initial(),
    this.disableNotificationsResult = const Initial(),
  });

  @override
  List<Object?> get props => [
    userProfileResult,
    logoutResult,
    deleteAccountResult,
    enableNotificationsResult,
    disableNotificationsResult,
  ];

  ProfileState copyWith({
    UiResult<UserEntity>? userProfileResult,
    UiResult<void>? logoutResult,
    UiResult<void>? deleteAccountResult,
    UiResult<void>? enableNotificationsResult,
    UiResult<void>? disableNotificationsResult,
  }) {
    return ProfileState(
      userProfileResult: userProfileResult ?? this.userProfileResult,
      logoutResult: logoutResult ?? this.logoutResult,
      deleteAccountResult: deleteAccountResult ?? this.deleteAccountResult,
      enableNotificationsResult:
          enableNotificationsResult ?? this.enableNotificationsResult,
      disableNotificationsResult:
          disableNotificationsResult ?? this.disableNotificationsResult,
    );
  }
}

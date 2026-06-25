import 'package:equatable/equatable.dart';

import '../../../../../../core/entities/user_entity.dart';
import '../../../../../../core/presentation/result/ui_result.dart';

class ProfileState with EquatableMixin {
  final UiResult<UserEntity> userProfileResult;

  const ProfileState({this.userProfileResult = const Initial()});

  @override
  List<Object?> get props => [userProfileResult];

  ProfileState copyWith({UiResult<UserEntity>? userProfileResult}) {
    return ProfileState(
      userProfileResult: userProfileResult ?? this.userProfileResult,
    );
  }
}

import 'dart:io';

import 'package:equatable/equatable.dart';

import '../../../../../../core/entities/user_entity.dart';
import '../../../../../../core/presentation/result/ui_result.dart';

class EditProfileState with EquatableMixin {
  final UserEntity originUser;
  final UserEntity editedUser;
  final bool userInfoChanged;
  final UiResult<void> editUserProfileResult;
  final UiResult<void> uploadProfilePictureResult;
  final File? tempImage;

  const EditProfileState({
    this.editUserProfileResult = const Initial(),
    this.uploadProfilePictureResult = const Initial(),
    this.originUser = const UserEntity(),
    this.editedUser = const UserEntity(),
    this.userInfoChanged = false,
    this.tempImage,
  });

  @override
  List<Object?> get props => [
    editUserProfileResult,
    uploadProfilePictureResult,
    originUser,
    editedUser,
    userInfoChanged,
    tempImage,
  ];

  EditProfileState copyWith({
    UiResult<void>? editUserProfileResult,
    UiResult<void>? uploadProfilePictureResult,
    UserEntity? originUser,
    UserEntity? editedUser,
    bool? userInfoChanged,
    File? tempImage,
    bool? clearTempImage,
  }) {
    return EditProfileState(
      editUserProfileResult:
          editUserProfileResult ?? this.editUserProfileResult,
      uploadProfilePictureResult:
          uploadProfilePictureResult ?? this.uploadProfilePictureResult,
      originUser: originUser ?? this.originUser,
      editedUser: editedUser ?? this.editedUser,
      userInfoChanged: userInfoChanged ?? this.userInfoChanged,
      tempImage: clearTempImage == true ? null : (tempImage ?? this.tempImage),
    );
  }
}

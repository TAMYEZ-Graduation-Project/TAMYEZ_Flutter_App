import 'dart:io';

import '../../../../core/entities/user_entity.dart';
import '../../../../core/execution/operation_result.dart';
import '../entities/change_password_params.dart';
import '../entities/edit_profile_params.dart';
import '../entities/upload_profile_picture_response_entity.dart';

abstract interface class ProfileRepository {
  Future<OperationResult<UserEntity>> getUserProfile();

  Future<OperationResult<UserEntity>> syncUserProfile();

  Future<OperationResult<void>> editUserProfile({
    required EditUserProfileParams params,
    bool saveLocally = true,
  });

  Future<OperationResult<UploadProfilePictureBodyEntity>> uploadProfilePicture({
    required File image,
    required int version,
    bool saveLocally = true,
  });

  Future<OperationResult<void>> changePassword({
    required ChangePasswordParams params,
    required bool userRemembered,
  });

  Future<OperationResult<void>> logout({String? deviceId});

  Future<OperationResult<void>> deleteAccount({required int version});

  Future<OperationResult<void>> enableNotifications({String? replaceDeviceId});

  Future<OperationResult<void>> refreshFcmToken({required String fcmToken});

  Future<OperationResult<void>> disableNotifications();
}

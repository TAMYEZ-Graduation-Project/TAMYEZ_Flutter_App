import '../../domain/entities/change_password_params.dart';
import '../../domain/entities/edit_profile_params.dart';
import '../../domain/entities/enable_notifications_params.dart';
import '../../domain/entities/upload_profile_picture_response_entity.dart';
import '../models/change_password_request.dart';
import '../models/edit_user_profile_request.dart';
import '../models/enable_notifications_request.dart';
import '../models/upload_profile_picture_response.dart';

extension EditUserProfileParamsMappers on EditUserProfileParams {
  EditUserProfileRequest toRequest() => EditUserProfileRequest(
    firstName: firstName,
    lastName: lastName,
    phoneNumber: phoneNumber,
    gender: gender,
    v: v,
  );
}

extension UploadProfilePictureResponseMappers on UploadProfilePictureResponse {
  UploadProfilePictureResponseEntity toEntity() =>
      UploadProfilePictureResponseEntity(
        success: success ?? true,
        message: message ?? '',
        body: body?.toEntity() ?? const UploadProfilePictureBodyEntity(),
      );
}

extension UploadProfilePictureBodyDtoMappers on UploadProfilePictureBodyDto {
  UploadProfilePictureBodyEntity toEntity() =>
      UploadProfilePictureBodyEntity(url: url ?? '', v: v ?? 0);
}

extension ChangePasswordParamsMappers on ChangePasswordParams {
  ChangePasswordRequest toRequest() => ChangePasswordRequest(
    currentPassword: currentPassword,
    newPassword: newPassword,
    confirmPassword: confirmPassword,
    v: v,
  );
}

extension EnableNotificationsParamsMappers on EnableNotificationsParams {
  EnableNotificationsRequest toRequest() => EnableNotificationsRequest(
    deviceId: deviceId,
    fcmToken: fcmToken,
    appVersion: appVersion,
    platform: platform,
    os: os,
    deviceModel: deviceModel,
  );
}

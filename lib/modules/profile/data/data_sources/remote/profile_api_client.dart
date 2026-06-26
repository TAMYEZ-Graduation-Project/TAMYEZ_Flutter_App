import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/dio.dart' show Extra;
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/network/dio/dio_constants.dart';
import '../../../../../core/network/models/simple_api_response.dart';
import '../../models/change_password_request.dart';
import '../../models/delete_account_request.dart';
import '../../models/disable_notifications_request.dart';
import '../../models/edit_user_profile_request.dart';
import '../../models/enable_notifications_request.dart';
import '../../models/get_user_profile_response.dart';
import '../../models/logout_request.dart';
import '../../models/refresh_fcm_token_request.dart';
import '../../models/upload_profile_picture_response.dart';
import 'profile_api_endpoints.dart';

part 'profile_api_client.g.dart';

@RestApi()
@lazySingleton
abstract class ProfileApiClient {
  @factoryMethod
  factory ProfileApiClient(@Named(DioNames.mainDio) Dio dio) =
      _ProfileApiClient;

  @GET(ProfileApiEndpoints.getUserProfile)
  @Extra({DioKeys.requiresAuth: true})
  Future<GetUserProfileResponse> getUserProfile();

  @PATCH(ProfileApiEndpoints.editUserProfile)
  @Extra({DioKeys.requiresAuth: true})
  Future<SimpleApiResponse> editUserProfile(
    @Body() EditUserProfileRequest request,
  );

  @PATCH(ProfileApiEndpoints.uploadProfilePicture)
  @MultiPart()
  @Extra({DioKeys.requiresAuth: true})
  Future<UploadProfilePictureResponse> uploadProfilePicture(
    @Part(name: ProfileApiParams.attachment) MultipartFile attachment,
    @Part(name: ProfileApiParams.version) int version,
  );

  @PATCH(ProfileApiEndpoints.changePassword)
  @Extra({DioKeys.requiresAuth: true})
  Future<SimpleApiResponse> changePassword(
    @Body() ChangePasswordRequest request,
  );

  @POST(ProfileApiEndpoints.logout)
  @Extra({DioKeys.requiresAuth: true})
  Future<SimpleApiResponse> logout(@Body() LogoutRequest request);

  @DELETE(ProfileApiEndpoints.deleteAccount)
  @Extra({DioKeys.requiresAuth: true})
  Future<SimpleApiResponse> deleteAccount(@Body() DeleteAccountRequest request);

  @POST(ProfileApiEndpoints.enableNotifications)
  @Extra({DioKeys.requiresAuth: true})
  Future<SimpleApiResponse> enableNotifications(
    @Body() EnableNotificationsRequest request,
  );

  @POST(ProfileApiEndpoints.refreshFcmToken)
  @Extra({DioKeys.requiresAuth: true})
  Future<SimpleApiResponse> refreshFcmToken(
    @Body() RefreshFcmTokenRequest request,
  );

  @POST(ProfileApiEndpoints.disableNotifications)
  @Extra({DioKeys.requiresAuth: true})
  Future<SimpleApiResponse> disableNotifications(
    @Body() DisableNotificationsRequest request,
  );
}

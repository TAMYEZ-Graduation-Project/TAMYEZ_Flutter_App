import 'package:dio/dio.dart';

import '../../../../../core/network/models/simple_api_response.dart';
import '../../models/change_password_request.dart';
import '../../models/edit_user_profile_request.dart';
import '../../models/get_user_profile_response.dart';
import '../../models/upload_profile_picture_response.dart';

abstract interface class ProfileRemoteDataSource {
  Future<GetUserProfileResponse> getUserProfile();

  Future<SimpleApiResponse> editUserProfile(EditUserProfileRequest request);

  Future<UploadProfilePictureResponse> uploadProfilePicture({
    required MultipartFile attachment,
    required int version,
  });

  Future<SimpleApiResponse> changePassword({
    required ChangePasswordRequest request,
  });
}

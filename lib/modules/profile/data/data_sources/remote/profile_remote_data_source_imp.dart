import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/models/simple_api_response.dart';
import '../../models/change_password_request.dart';
import '../../models/edit_user_profile_request.dart';
import '../../models/get_user_profile_response.dart';
import '../../models/upload_profile_picture_response.dart';
import 'profile_api_client.dart';
import 'profile_remote_data_source.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImp implements ProfileRemoteDataSource {
  final ProfileApiClient _profileApiClient;

  const ProfileRemoteDataSourceImp(this._profileApiClient);

  @override
  Future<GetUserProfileResponse> getUserProfile() {
    return _profileApiClient.getUserProfile();
  }

  @override
  Future<SimpleApiResponse> editUserProfile(EditUserProfileRequest request) {
    return _profileApiClient.editUserProfile(request);
  }

  @override
  Future<UploadProfilePictureResponse> uploadProfilePicture({
    required MultipartFile attachment,
    required int version,
  }) {
    return _profileApiClient.uploadProfilePicture(attachment, version);
  }

  @override
  Future<SimpleApiResponse> changePassword({
    required ChangePasswordRequest request,
  }) {
    return _profileApiClient.changePassword(request);
  }
}

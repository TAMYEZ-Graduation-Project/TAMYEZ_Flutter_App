import '../../../../../core/network/models/user_dto.dart';

class GetUserProfileResponse {
  bool? success;
  String? message;

  GetUserProfileResponseBody? body;

  GetUserProfileResponse({this.success, this.message, this.body});

  factory GetUserProfileResponse.fromJson(Map<String, dynamic> json) {
    return GetUserProfileResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      body: json['body'] != null
          ? GetUserProfileResponseBody.fromJson(
              json['body'] as Map<String, dynamic>,
            )
          : null,
    );
  }
}

class GetUserProfileResponseBody {
  UserDto? user;

  GetUserProfileResponseBody({this.user});

  factory GetUserProfileResponseBody.fromJson(Map<String, dynamic> json) {
    return GetUserProfileResponseBody(
      user: json['user'] != null
          ? UserDto.fromJson(json['user'] as Map<String, dynamic>)
          : null,
    );
  }
}

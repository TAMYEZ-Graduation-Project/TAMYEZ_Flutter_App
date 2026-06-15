import '../../../../core/network/models/login_session_dto.dart';

class LoginResponse {
  LoginResponse({this.success, this.message, this.body});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'] as bool?;
    message = json['message'] as String?;
    body = json['body'] != null
        ? LoginSessionDto.fromJson(json['body'] as Map<String, dynamic>)
        : null;
  }

  bool? success;
  String? message;
  LoginSessionDto? body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (body != null) {
      map['body'] = body?.toJson();
    }
    return map;
  }
}

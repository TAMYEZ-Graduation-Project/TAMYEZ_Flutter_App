import 'user_dto.dart';

class LoginSessionDto {
  LoginSessionDto({this.accessToken, this.user});

  LoginSessionDto.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'] as String?;
    user = json['user'] != null
        ? UserDto.fromJson(json['user'] as Map<String, dynamic>)
        : null;
  }

  String? accessToken;
  UserDto? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = accessToken;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}

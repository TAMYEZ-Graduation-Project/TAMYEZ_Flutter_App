class LoginResponse {
  LoginResponse({this.success, this.message, this.body});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'] as bool?;
    message = json['message'] as String?;
    body = json['body'] != null
        ? BodyDto.fromJson(json['body'] as Map<String, dynamic>)
        : null;
  }

  bool? success;
  String? message;
  BodyDto? body;

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

class BodyDto {
  BodyDto({this.accessToken, this.user});

  BodyDto.fromJson(Map<String, dynamic> json) {
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

class UserDto {
  UserDto({
    this.id,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.gender,
    this.role,
    this.assessmentStatus,
    this.createdAt,
    this.updatedAt,
    this.confirmedAt,
    this.v,
  });

  UserDto.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    fullName = json['fullName'] as String?;
    email = json['email'] as String?;
    phoneNumber = json['phoneNumber'] as String?;
    gender = json['gender'] as String?;
    role = json['role'] as String?;
    assessmentStatus = json['assessmentStatus'] as String?;
    createdAt = json['createdAt'] as String?;
    updatedAt = json['updatedAt'] as String?;
    confirmedAt = json['confirmedAt'] as String?;
    v = json['v'] as num?;
  }

  String? id;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? gender;
  String? role;
  String? assessmentStatus;
  String? createdAt;
  String? updatedAt;
  String? confirmedAt;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['fullName'] = fullName;
    map['email'] = email;
    map['phoneNumber'] = phoneNumber;
    map['gender'] = gender;
    map['role'] = role;
    map['assessmentStatus'] = assessmentStatus;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['confirmedAt'] = confirmedAt;
    map['v'] = v;
    return map;
  }
}

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

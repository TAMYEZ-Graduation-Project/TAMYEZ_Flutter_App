import '../../domain/entities/user_entity.dart';

class UserDto {
  UserDto({
    this.id,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.gender,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.confirmedAt,
    this.v,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      gender: json['gender'] as String?,
      role: json['role'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      confirmedAt: json['confirmedAt'] as String?,
      v: json['v'] as int?,
    );
  }

  String? id;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? gender;
  String? role;
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
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['confirmedAt'] = confirmedAt;
    map['v'] = v;
    return map;
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id ?? '',
      fullName: fullName ?? '',
      email: email ?? '',
      phoneNumber: phoneNumber ?? '',
      gender: gender ?? '',
      role: role ?? '',
      createdAt: createdAt ?? '',
      updatedAt: updatedAt ?? '',
      confirmedAt: confirmedAt ?? '',
      v: v ?? 0,
    );
  }

  static UserDto fromEntity(UserEntity entity) {
    return UserDto(
      id: entity.id,
      fullName: entity.fullName,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      gender: entity.gender,
      role: entity.role,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      confirmedAt: entity.confirmedAt,
      v: entity.v,
    );
  }
}

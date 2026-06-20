import 'career_dto.dart';

class UserDto {
  final String? id;
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? gender;
  final String? role;
  final String? assessmentStatus;
  final CareerDto? careerPath;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? confirmedAt;
  final num? v;

  UserDto({
    this.id,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.gender,
    this.role,
    this.assessmentStatus,
    this.careerPath,
    this.createdAt,
    this.updatedAt,
    this.confirmedAt,
    this.v,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id']?.toString(),
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      gender: json['gender'] as String?,
      role: json['role'] as String?,
      assessmentStatus: json['assessmentStatus'] as String?,
      careerPath: json['careerPath'] != null
          ? CareerDto.fromJson(json['careerPath'] as Map<String, dynamic>)
          : null,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
      confirmedAt: json['confirmedAt'] != null
          ? DateTime.parse(json['confirmedAt'] as String)
          : null,
      v: json['v'] as num?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'role': role,
      'assessmentStatus': assessmentStatus,
      'careerPath': careerPath?.toJson(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'confirmedAt': confirmedAt?.toIso8601String(),
      'v': v,
    };
  }
}

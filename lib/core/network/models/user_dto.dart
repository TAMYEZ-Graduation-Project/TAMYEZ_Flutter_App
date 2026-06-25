import 'career_dto.dart';

class UserDto {
  final String? id;
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? gender;
  final String? role;

  final String? profilePicture;
  final String? assessmentStatus;
  final CareerPathDto? careerPath;
  final String? createdAt;
  final String? updatedAt;
  final String? confirmedAt;
  final num? v;

  UserDto({
    this.id,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.gender,
    this.role,
    this.profilePicture,
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
      profilePicture: json['profilePicture'] as String?,
      assessmentStatus: json['assessmentStatus'] as String?,
      careerPath: json['careerPath'] != null
          ? CareerPathDto.fromJson(json['careerPath'] as Map<String, dynamic>)
          : null,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      confirmedAt: json['confirmedAt'] as String?,
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
      'profilePicture': profilePicture,
      'assessmentStatus': assessmentStatus,
      'careerPath': careerPath?.toJson(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'confirmedAt': confirmedAt,
      'v': v,
    };
  }

  @override
  String toString() {
    return 'UserDto: $id, $fullName, $email, $phoneNumber, $gender, $role, $assessmentStatus, $createdAt, $updatedAt, $confirmedAt, $v';
  }

  UserDto copyWith({
    String? id,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? gender,
    String? role,
    String? profilePicture,
    String? assessmentStatus,
    CareerPathDto? careerPath,
    String? createdAt,
    String? updatedAt,
    String? confirmedAt,
    num? v,
  }) {
    return UserDto(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      gender: gender ?? this.gender,
      role: role ?? this.role,
      profilePicture: profilePicture ?? this.profilePicture,
      assessmentStatus: assessmentStatus ?? this.assessmentStatus,
      careerPath: careerPath ?? this.careerPath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      confirmedAt: confirmedAt ?? this.confirmedAt,
      v: v ?? this.v,
    );
  }
}

class CareerPathDto {
  String? id;
  String? selectedAt;
  CareerDto? career;

  CareerPathDto({this.id, this.selectedAt, this.career});

  factory CareerPathDto.fromJson(Map<String, dynamic> json) {
    final careerPath = json['careerPath'] as Map<String, dynamic>?;

    return CareerPathDto(
      id: careerPath?['id'] as String?,
      selectedAt: careerPath?['selectedAt'] as String?,
      career: careerPath?['career'] != null
          ? CareerDto.fromJson(careerPath!['career'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'careerPath': {
        'id': id,
        'selectedAt': selectedAt,
        'career': career?.toJson(),
      },
    };
  }
}

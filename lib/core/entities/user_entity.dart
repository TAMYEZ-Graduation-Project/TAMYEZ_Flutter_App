import 'package:equatable/equatable.dart';

import '../constants/app_enums.dart';
import 'career_entity.dart';

class UserEntity extends Equatable {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String gender;
  final String role;
  final String profilePicture;
  final CareerAssessmentStatusEnum assessmentStatus;
  final CareerPathEntity careerPath;
  final String createdAt;
  final String updatedAt;
  final String confirmedAt;
  final num v;

  const UserEntity({
    this.id = '',
    this.fullName = '',
    this.email = '',
    this.phoneNumber = '+20',
    this.gender = '',
    this.role = '',
    this.profilePicture = '',
    this.assessmentStatus = CareerAssessmentStatusEnum.notStarted,
    this.careerPath = const CareerPathEntity(),
    this.createdAt = '',
    this.updatedAt = '',
    this.confirmedAt = '',
    this.v = 0,
  });

  @override
  List<Object> get props => [
    id,
    fullName,
    email,
    phoneNumber,
    gender,
    role,
    profilePicture,
    assessmentStatus,
    careerPath,
    createdAt,
    updatedAt,
    confirmedAt,
    v,
  ];

  @override
  String toString() {
    return 'UserEntity: $id, $fullName, $email, $phoneNumber, $gender, $role, $assessmentStatus, $createdAt, $updatedAt, $confirmedAt, $v';
  }

  UserEntity copyWith({
    String? id,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? gender,
    String? role,
    String? profilePicture,
    CareerAssessmentStatusEnum? assessmentStatus,
    CareerPathEntity? careerPath,
    String? createdAt,
    String? updatedAt,
    String? confirmedAt,
    num? v,
  }) {
    return UserEntity(
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

class CareerPathEntity extends Equatable {
  final String id;
  final String selectedAt;
  final CareerEntity career;

  const CareerPathEntity({
    this.id = '',
    this.selectedAt = '',
    this.career = const CareerEntity(),
  });

  @override
  List<Object> get props => [id, selectedAt, career];
}

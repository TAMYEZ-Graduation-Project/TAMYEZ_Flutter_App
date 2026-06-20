import 'package:equatable/equatable.dart';

import 'career_entity.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? gender;
  final String? role;
  final String? assessmentStatus;
  final CareerEntity? careerPath;
  final String? createdAt;
  final String? updatedAt;
  final String? confirmedAt;
  final num? v;

  const UserEntity({
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

  @override
  List<Object?> get props => [
    id,
    fullName,
    email,
    phoneNumber,
    gender,
    role,
    assessmentStatus,
    careerPath,
    createdAt,
    updatedAt,
    confirmedAt,
    v,
  ];
}

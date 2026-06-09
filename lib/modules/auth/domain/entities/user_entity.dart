import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? gender;
  final String? role;
  final String? assessmentStatus;
  final String? createdAt;
  final String? updatedAt;
  final String? confirmedAt;

  const UserEntity({
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
    createdAt,
    updatedAt,
    confirmedAt,
  ];
}

class UserEntity {
  String id;
  String fullName;
  String email;
  String phoneNumber;
  String gender;
  String role;
  String createdAt;
  String updatedAt;
  String confirmedAt;
  num v;

  UserEntity({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.confirmedAt,
    required this.v,
  });
}

class EditUserProfileParams {
  EditUserProfileParams({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.gender,
    required this.v,
  });

  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? gender;
  num v;
}

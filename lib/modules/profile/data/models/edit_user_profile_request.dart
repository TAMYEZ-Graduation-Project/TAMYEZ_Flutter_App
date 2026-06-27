class EditUserProfileRequest {
  EditUserProfileRequest({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.gender,
    required this.v,
  });

  EditUserProfileRequest.fromJson(dynamic json) {
    firstName = json['firstName'] as String;
    lastName = json['lastName'] as String;
    phoneNumber = json['phoneNumber'] as String;
    gender = json['gender'] as String;
    v = json['v'] as num;
  }

  late String? firstName;
  late String? lastName;
  late String? phoneNumber;
  late String? gender;
  late num v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (firstName != null) map['firstName'] = firstName;
    if (lastName != null) map['lastName'] = lastName;
    if (phoneNumber != null) map['phoneNumber'] = phoneNumber;
    if (gender != null) map['gender'] = gender;
    map['v'] = v;
    return map;
  }
}

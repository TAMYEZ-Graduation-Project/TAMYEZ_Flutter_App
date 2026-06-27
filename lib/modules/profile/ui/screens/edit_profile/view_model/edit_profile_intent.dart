sealed class EditProfileIntent {
  const EditProfileIntent();
}

class OnFieldsChangeIntent extends EditProfileIntent {
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? gender;

  const OnFieldsChangeIntent({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.gender,
  });

  @override
  String toString() {
    return 'OnFieldsChangeIntent(firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, gender: $gender)';
  }
}

class EditUserInfoIntent extends EditProfileIntent {
  const EditUserInfoIntent();
}

class UploadProfilePictureIntent extends EditProfileIntent {
  const UploadProfilePictureIntent();
}

class GetUserProfileIntent extends EditProfileIntent {
  const GetUserProfileIntent();
}

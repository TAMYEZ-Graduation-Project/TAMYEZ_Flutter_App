sealed class ProfileIntent {
  const ProfileIntent();
}

class GetUserProfileIntent extends ProfileIntent {
  const GetUserProfileIntent();
}

class LogoutIntent extends ProfileIntent {
  const LogoutIntent();
}

class DeleteAccountIntent extends ProfileIntent {
  const DeleteAccountIntent();
}

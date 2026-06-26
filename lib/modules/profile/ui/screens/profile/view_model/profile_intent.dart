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

class EnableNotificationsIntent extends ProfileIntent {
  final String? replaceDeviceId;

  const EnableNotificationsIntent({this.replaceDeviceId});
}

class DisableNotificationsIntent extends ProfileIntent {
  const DisableNotificationsIntent();
}

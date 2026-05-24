enum UserRole { user, admin, superAdmin, guest }

class AuthToken {
  final String value;
  final UserRole role;

  AuthToken({required this.value, required this.role});

  String toHeaderValue() {
    switch (role) {
      case UserRole.admin:
        return 'Admin $value';
      case UserRole.user:
        return 'Bearer $value';
      case UserRole.guest:
        return '';
      case UserRole.superAdmin:
        return 'SuperAdmin $value';
    }
  }
}

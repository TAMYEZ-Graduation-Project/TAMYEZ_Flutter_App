import 'package:equatable/equatable.dart';

class LoginParams extends Equatable {
  final String email;
  final String password;
  final String? deviceId;
  final String? fcmToken;

  const LoginParams({
    required this.email,
    required this.password,
    this.deviceId,
    this.fcmToken,
  });

  @override
  List<Object?> get props => [email, password, deviceId, fcmToken];
}

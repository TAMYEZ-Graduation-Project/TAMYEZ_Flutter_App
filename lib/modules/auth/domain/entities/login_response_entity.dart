import 'package:equatable/equatable.dart';

import 'user_entity.dart';

class LoginResponseEntity extends Equatable {
  final bool? success;
  final String? message;
  final String? accessToken;
  final UserEntity? user;

  const LoginResponseEntity({
    this.success,
    this.message,
    this.accessToken,
    this.user,
  });

  @override
  List<Object?> get props => [success, message, accessToken, user];
}

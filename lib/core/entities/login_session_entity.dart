import 'package:equatable/equatable.dart';

import 'auth_token.dart';
import 'user_entity.dart';

class LoginSessionEntity extends Equatable {
  const LoginSessionEntity({required this.token, required this.user});

  final AuthToken token;
  final UserEntity user;

  @override
  List<Object?> get props => [token, user];
}

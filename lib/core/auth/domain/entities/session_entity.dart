import 'auth_token.dart';
import 'user_entity.dart';

class SessionEntity {
  final UserEntity user;
  final AuthToken token;

  const SessionEntity({required this.user, required this.token});
}

import '../../domain/entities/auth_token.dart' show AuthToken, UserRole;
import '../../domain/entities/session_entity.dart';
import 'user_dto.dart';

class StoredSessionDto {
  final UserDto user;
  final String token;

  StoredSessionDto({required this.user, required this.token});

  factory StoredSessionDto.fromJson(Map<String, dynamic> json) {
    return StoredSessionDto(
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String,
    );
  }

  SessionEntity toEntity() {
    return SessionEntity(
      user: user.toEntity(),
      token: AuthToken(
        value: token,
        role: UserRole.values.byName(user.role ?? ''),
      ),
    );
  }

  static StoredSessionDto fromEntity(SessionEntity session) {
    return StoredSessionDto(
      user: UserDto.fromEntity(session.user),
      token: session.token.value,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user'] = user.toJson();
    map['token'] = token;
    return map;
  }
}

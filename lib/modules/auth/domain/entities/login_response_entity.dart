import 'package:equatable/equatable.dart';

import '../../../../core/entities/login_session_entity.dart'
    show LoginSessionEntity;

class LoginResponseEntity extends Equatable {
  final bool? success;
  final String? message;
  final LoginSessionEntity body;

  const LoginResponseEntity({this.success, this.message, required this.body});

  @override
  List<Object?> get props => [success, message, body];
}

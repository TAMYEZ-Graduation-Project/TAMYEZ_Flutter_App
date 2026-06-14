import 'package:equatable/equatable.dart';

class SignUpParams extends Equatable {
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;
  final String gender;
  final String phoneNumber;

  const SignUpParams({
    required this.fullName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.gender,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [
    fullName,
    email,
    password,
    confirmPassword,
    gender,
    phoneNumber,
  ];
}

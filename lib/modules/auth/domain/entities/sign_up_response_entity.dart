import 'package:equatable/equatable.dart';

class SignUpResponseEntity extends Equatable {
  final bool? success;
  final String? message;

  const SignUpResponseEntity({this.success, this.message});

  @override
  List<Object?> get props => [success, message];
}

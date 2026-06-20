import 'package:equatable/equatable.dart';

import '../../../../core/entities/career_entity.dart';

class CareerDetailsResponseEntity extends Equatable {
  const CareerDetailsResponseEntity({
    this.success = false,
    this.message = '',
    this.body = const CareerEntity(),
  });

  final bool success;
  final String message;
  final CareerEntity body;

  @override
  List<Object?> get props => [success, message, body];
}

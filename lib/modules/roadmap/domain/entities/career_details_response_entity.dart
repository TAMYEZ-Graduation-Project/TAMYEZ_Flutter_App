import 'package:equatable/equatable.dart';

import '../../../../core/entities/career_entity.dart';

class CareerDetailsResponseEntity extends Equatable {
  final bool success;
  final String message;
  final CareerEntity body;

  const CareerDetailsResponseEntity({
    this.success = false,
    this.message = '',
    this.body = const CareerEntity(),
  });

  @override
  List<Object?> get props => [success, message, body];
}

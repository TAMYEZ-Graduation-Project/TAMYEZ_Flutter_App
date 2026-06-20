import 'package:equatable/equatable.dart';

import '../../../../core/entities/career_entity.dart';
import '../../../../core/entities/user_entity.dart';

class ChooseSuggestedCareerResponseEntity extends Equatable {
  final bool success;
  final String message;
  final ChooseSuggestedCareerBodyEntity body;

  const ChooseSuggestedCareerResponseEntity({
    this.success = false,
    this.message = '',
    this.body = const ChooseSuggestedCareerBodyEntity(),
  });

  @override
  List<Object?> get props => [success, message, body];
}

class ChooseSuggestedCareerBodyEntity extends Equatable {
  final UserEntity user;

  const ChooseSuggestedCareerBodyEntity({this.user = const UserEntity()});

  @override
  List<Object?> get props => [user];
}

class CareerPath extends Equatable {
  final String id;
  final DateTime? selectedAt;
  final CareerEntity career;

  const CareerPath({
    this.id = '',
    this.selectedAt,
    this.career = const CareerEntity(),
  });

  @override
  List<Object?> get props => [id, selectedAt, career];
}

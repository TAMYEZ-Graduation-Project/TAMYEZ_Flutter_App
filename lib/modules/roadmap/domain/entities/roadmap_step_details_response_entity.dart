import 'package:equatable/equatable.dart';

import '../../../../core/entities/roadmap_step_entity.dart';

class RoadmapStepDetailsResponseEntity extends Equatable {
  final bool success;
  final String message;
  final RoadmapStepEntity body;

  const RoadmapStepDetailsResponseEntity({
    this.success = false,
    this.message = '',
    this.body = const RoadmapStepEntity(),
  });

  @override
  List<Object?> get props => [success, message, body];
}

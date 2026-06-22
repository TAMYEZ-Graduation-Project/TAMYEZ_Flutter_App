import 'package:equatable/equatable.dart';

import '../../../../core/entities/pagination_data_entity.dart';
import '../../../../core/entities/roadmap_step_entity.dart';

class RoadmapStepsResponseEntity extends Equatable {
  final bool success;
  final String message;
  final RoadmapStepsResponseBodyEntity body;

  const RoadmapStepsResponseEntity({
    this.success = false,
    this.message = '',
    this.body = const RoadmapStepsResponseBodyEntity(),
  });

  @override
  List<Object?> get props => [success, message, body];
}

class RoadmapStepsResponseBodyEntity extends Equatable {
  final PaginationDataEntity paginationData;
  final num percentageCompleted;
  final List<RoadmapStepEntity> data;

  const RoadmapStepsResponseBodyEntity({
    this.paginationData = const PaginationDataEntity(),
    this.percentageCompleted = 0,
    this.data = const [],
  });

  @override
  List<Object?> get props => [paginationData, percentageCompleted, data];
}

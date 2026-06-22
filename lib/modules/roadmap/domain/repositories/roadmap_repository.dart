import '../../../../core/entities/career_entity.dart';
import '../../../../core/execution/operation_result.dart';
import '../entities/roadmap_steps_response_entity.dart';

abstract interface class RoadmapRepository {
  Future<OperationResult<CareerEntity>> getUserCareer();

  Future<OperationResult<RoadmapStepsResponseBodyEntity>> getRoadmapSteps(
    int page,
    int size,
  );
}

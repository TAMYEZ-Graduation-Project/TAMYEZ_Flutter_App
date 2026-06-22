import '../../../../core/entities/career_entity.dart';
import '../../../../core/entities/roadmap_step_entity.dart';
import '../../../../core/execution/operation_result.dart';
import '../entities/roadmap_steps_response_entity.dart';

abstract interface class RoadmapRepository {
  Future<OperationResult<CareerEntity>> getUserCareer({required String userId});

  Future<OperationResult<RoadmapStepsResponseBodyEntity>> getRoadmapSteps({
    required int page,
    required int size,
    required String userId,
  });

  Future<OperationResult<RoadmapStepEntity>> getRoadmapStepDetails(
    String roadmapStepId,
  );
}

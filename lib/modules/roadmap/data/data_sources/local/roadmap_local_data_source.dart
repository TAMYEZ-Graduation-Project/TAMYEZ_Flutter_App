import '../../../../../core/layers/db/contracts/db_base_repository.dart';
import '../../local_models/roadmap_step_local.dart';

abstract interface class RoadmapLocalDataSource
    implements DbBaseRepository<RoadmapStepLocal> {
  Future<void> refreshSteps({
    required List<RoadmapStepLocal> incomingSteps,
    required String userId,
  });

  Future<List<RoadmapStepLocal>> paginateRoadmapSteps({
    required int page,
    required int size,
    required String userId,
  });

  Future<void> deleteRoadmapStepsOfUser({required String userId});
}

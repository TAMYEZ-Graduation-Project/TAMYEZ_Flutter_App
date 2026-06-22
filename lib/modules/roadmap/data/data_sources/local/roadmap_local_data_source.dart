import '../../../../../core/layers/db/contracts/db_base_repository.dart';
import '../../local_models/roadmap_step_local.dart';

abstract interface class RoadmapLocalDataSource
    implements DbBaseRepository<RoadmapStepLocal> {
  Future<void> refreshSteps(List<RoadmapStepLocal> steps);

  Future<List<RoadmapStepLocal>> paginateRoadmapSteps({
    required int page,
    required int size,
  });
}

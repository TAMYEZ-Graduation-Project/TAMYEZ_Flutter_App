import 'package:injectable/injectable.dart' show injectable;

import '../../../../core/entities/roadmap_step_entity.dart';
import '../../../../core/execution/operation_result.dart';
import '../repositories/roadmap_repository.dart';

@injectable
class GetRoadmapStepDetailsUseCase {
  final RoadmapRepository _repository;

  const GetRoadmapStepDetailsUseCase(this._repository);

  Future<OperationResult<RoadmapStepEntity>> call({
    required String roadmapStepId,
  }) {
    return _repository.getRoadmapStepDetails(roadmapStepId);
  }
}

import 'package:injectable/injectable.dart';

import '../../../../core/execution/operation_result.dart';
import '../entities/roadmap_steps_response_entity.dart';
import '../repositories/roadmap_repository.dart';

@injectable
class GetRoadmapStepsUseCase {
  final RoadmapRepository _repository;

  const GetRoadmapStepsUseCase(this._repository);

  Future<OperationResult<RoadmapStepsResponseBodyEntity>> call({
    int page = 0,
    int size = 10,
  }) {
    return _repository.getRoadmapSteps(page, size);
  }
}

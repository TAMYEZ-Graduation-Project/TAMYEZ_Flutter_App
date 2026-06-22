import 'package:injectable/injectable.dart';

import '../../../../core/execution/operation_result.dart';
import '../entities/roadmap_steps_response_entity.dart';
import '../repositories/roadmap_repository.dart';

@injectable
class GetRoadmapStepsUseCase {
  final RoadmapRepository _repository;

  const GetRoadmapStepsUseCase(this._repository);

  Future<OperationResult<RoadmapStepsResponseBodyEntity>> call({
    required int page,
    int size = 10,
    required String careerId,
  }) {
    return _repository.getRoadmapSteps(
      page: page,
      size: size,
      careerId: careerId,
    );
  }
}

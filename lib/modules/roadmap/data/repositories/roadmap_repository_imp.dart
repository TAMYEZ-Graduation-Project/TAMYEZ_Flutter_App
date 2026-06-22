import 'package:injectable/injectable.dart';

import '../../../../core/entities/career_entity.dart';
import '../../../../core/entities/roadmap_step_entity.dart';
import '../../../../core/execution/operation_result.dart';
import '../../../../core/utils/functions/repo_result_handler.dart';
import '../../domain/entities/roadmap_steps_response_entity.dart';
import '../../domain/repositories/roadmap_repository.dart';
import '../data_sources/remote/roadmap_remote_data_source.dart';
import '../mappers/roadmap_mappers.dart';

@Injectable(as: RoadmapRepository)
class RoadmapRepositoryImp implements RoadmapRepository {
  final RoadmapRemoteDataSource _roadmapRemoteDataSource;

  const RoadmapRepositoryImp(this._roadmapRemoteDataSource);

  @override
  Future<OperationResult<CareerEntity>> getUserCareer() {
    return repoResultHandler(() async {
      return (await _roadmapRemoteDataSource.getUserCareer()).toEntity().body;
    });
  }

  @override
  Future<OperationResult<RoadmapStepsResponseBodyEntity>> getRoadmapSteps(
    int page,
    int size,
  ) {
    return repoResultHandler(() async {
      return (await _roadmapRemoteDataSource.getRoadmapSteps(
        page,
        size,
      )).toEntity().body;
    });
  }

  @override
  Future<OperationResult<RoadmapStepEntity>> getRoadmapStepDetails(
    String roadmapStepId,
  ) {
    return repoResultHandler(() async {
      return (await _roadmapRemoteDataSource.getRoadmapStepDetails(
        roadmapStepId,
      )).toEntity().body;
    });
  }
}

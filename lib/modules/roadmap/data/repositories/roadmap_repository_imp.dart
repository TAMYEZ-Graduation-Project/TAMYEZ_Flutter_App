import 'package:injectable/injectable.dart';

import '../../../../core/entities/career_entity.dart';
import '../../../../core/entities/pagination_data_entity.dart';
import '../../../../core/entities/roadmap_step_entity.dart';
import '../../../../core/error/failures/app_failures.dart';
import '../../../../core/execution/operation_result.dart';
import '../../../../core/extensions/check_local_saved_model_has_expired.dart';
import '../../../../core/utils/functions/repo_result_handler.dart';
import '../../../../core/utils/functions/safe_print.dart';
import '../../domain/entities/roadmap_steps_response_entity.dart';
import '../../domain/repositories/roadmap_repository.dart';
import '../data_sources/local/career_local_data_source.dart';
import '../data_sources/local/roadmap_local_data_source.dart';
import '../data_sources/remote/roadmap_remote_data_source.dart';
import '../mappers/roadmap_mappers.dart';

@Injectable(as: RoadmapRepository)
class RoadmapRepositoryImp implements RoadmapRepository {
  final RoadmapRemoteDataSource _roadmapRemoteDataSource;
  final CareerLocalDataSource _careerLocalDataSource;
  final RoadmapLocalDataSource _roadmapLocalDataSource;

  const RoadmapRepositoryImp(
    this._roadmapRemoteDataSource,
    this._careerLocalDataSource,
    this._roadmapLocalDataSource,
  );

  @override
  Future<OperationResult<CareerEntity>> getUserCareer({
    required String careerId,
  }) async {
    final result = await repoResultHandler(() async {
      return (await _roadmapRemoteDataSource.getUserCareer()).toEntity().body;
    });
    switch (result) {
      case OperationSuccess<CareerEntity>():
        final savedCareer = await _careerLocalDataSource.findByCareerId(
          careerId: careerId,
        );
        if (savedCareer == null ||
            savedCareer.savedAt.isExpired() ||
            (savedCareer.v < result.data.v &&
                savedCareer.orderEpoch < result.data.orderEpoch)) {
          await _careerLocalDataSource.create([result.data.toLocal()]);
          await _roadmapLocalDataSource.refreshSteps(
            result.data.roadmap.map((e) => e.toLocal()).toList(),
          );
        } else {
          if (savedCareer.orderEpoch == result.data.orderEpoch) {
            await _careerLocalDataSource.create([
              result.data.toLocal(
                lastPage: savedCareer.lastPage,
                size: savedCareer.size,
              ),
            ]);
          }
        }

        return result;
      case OperationFailure<CareerEntity>():
        if (result.failure is NoInternetFailure) {
          final careerLocal = await _careerLocalDataSource.findByCareerId(
            careerId: careerId,
          );
          if (careerLocal != null) {
            final steps = await _roadmapLocalDataSource.paginateRoadmapSteps(
              page: 1,
              size: 10,
            );
            final newCareer = careerLocal.toEntity().copyWith(
              roadmap: steps.map((e) => e.toEntity()).toList(),
            );
            return OperationSuccess<CareerEntity>(
              newCareer,
              warning: result.failure,
            );
          }
        }
        return result;
    }
  }

  @override
  Future<OperationResult<RoadmapStepsResponseBodyEntity>> getRoadmapSteps({
    required int page,
    required int size,
    required String careerId,
  }) async {
    final savedCareer = (await _careerLocalDataSource.findByCareerId(
      careerId: careerId,
    ))!;
    if (savedCareer.lastPage >= page && savedCareer.size == size) {
      final savedSteps = (await _roadmapLocalDataSource.paginateRoadmapSteps(
        page: page,
        size: size,
      )).map((e) => e.toEntity()).toList();
      return OperationSuccess(
        RoadmapStepsResponseBodyEntity(
          data: savedSteps,
          paginationData: PaginationDataEntity(
            size: size,
            currentPage: page,
            totalCount: savedCareer.stepsCount,
            totalPages: (savedCareer.stepsCount / size).ceil(),
          ),
          percentageCompleted: savedCareer.percentageCompleted,
        ),
      );
    }
    safePrint('getting steps from API');
    final result = await repoResultHandler(() async {
      return (await _roadmapRemoteDataSource.getRoadmapSteps(
        page,
        size,
      )).toEntity().body;
    });

    switch (result) {
      case OperationSuccess<RoadmapStepsResponseBodyEntity>():
        await _roadmapLocalDataSource.create(
          result.data.data.map((e) => e.toLocal()).toList(),
        );
        savedCareer.lastPage = page;
        savedCareer.size = size;
        savedCareer.stepsCount = result.data.paginationData.totalCount.toInt();
        savedCareer.percentageCompleted = result.data.percentageCompleted
            .toInt();
        await _careerLocalDataSource.create([savedCareer]);
        return result;
      case OperationFailure<RoadmapStepsResponseBodyEntity>():
        return result;
    }
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

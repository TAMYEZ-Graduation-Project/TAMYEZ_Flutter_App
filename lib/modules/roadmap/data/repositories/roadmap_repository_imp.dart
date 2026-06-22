import 'package:injectable/injectable.dart';
import 'package:isar_community/isar.dart';

import '../../../../core/entities/career_entity.dart';
import '../../../../core/entities/pagination_data_entity.dart';
import '../../../../core/entities/roadmap_step_entity.dart';
import '../../../../core/error/failures/app_failures.dart';
import '../../../../core/execution/operation_result.dart';
import '../../../../core/utils/functions/repo_result_handler.dart';
import '../../domain/entities/roadmap_steps_response_entity.dart';
import '../../domain/repositories/roadmap_repository.dart';
import '../data_sources/local/career_local_data_source.dart';
import '../data_sources/local/roadmap_local_data_source.dart';
import '../data_sources/remote/roadmap_remote_data_source.dart';
import '../mappers/roadmap_mappers.dart';

@Injectable(as: RoadmapRepository)
class RoadmapRepositoryImp implements RoadmapRepository {
  final RoadmapRemoteDataSource _roadmapRemoteDataSource;
  final Isar _isar;
  final CareerLocalDataSource _careerLocalDataSource;
  final RoadmapLocalDataSource _roadmapLocalDataSource;

  const RoadmapRepositoryImp(this._isar,
    this._roadmapRemoteDataSource,
    this._careerLocalDataSource,
    this._roadmapLocalDataSource,
  );

  @override
  Future<OperationResult<CareerEntity>> getUserCareer({
    required String userId,
  }) async {
    final result = await repoResultHandler(() async {
      return (await _roadmapRemoteDataSource.getUserCareer()).toEntity().body;
    });
    switch (result) {
      case OperationSuccess<CareerEntity>():
        final savedCareer = await _careerLocalDataSource.findByUserId(
          userId: userId,
        );
        await _isar.writeTxn(() async {
          if (savedCareer == null &&
              (await _careerLocalDataSource.careersCount() >= 2)) {
            final userOfDeletedCareer = await _careerLocalDataSource
                .deletedOldestCareer();
            if (userOfDeletedCareer != null) {
              await _roadmapLocalDataSource.deleteRoadmapStepsOfUser(
                userId: userOfDeletedCareer,
              );
            }
          }
          await _careerLocalDataSource.upsertCareer(
            career: result.data.toLocal(
              userId: userId,
              lastPage: savedCareer?.lastPage ?? 1,
              size: savedCareer?.size ?? 10,
            ),
          );
          await _roadmapLocalDataSource.refreshSteps(
            userId: userId,
            incomingSteps: result.data.roadmap
                .map(
                  (e) => e.toLocal(userId: userId)..careerId = result.data.id,
                )
                .toList(),
          );
        });
        return result;
      case OperationFailure<CareerEntity>():
        if (result.failure is NoInternetFailure) {
          final careerLocal = await _careerLocalDataSource.findByUserId(
            userId: userId,
          );
          if (careerLocal != null) {
            final steps = await _roadmapLocalDataSource.paginateRoadmapSteps(
              userId: userId,
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
    required String userId,
  }) async {
    final savedCareer = (await _careerLocalDataSource.findByUserId(
      userId: userId,
    ))!;
    final result = await repoResultHandler(() async {
      return (await _roadmapRemoteDataSource.getRoadmapSteps(
        page,
        size,
      )).toEntity().body;
    });

    switch (result) {
      case OperationSuccess<RoadmapStepsResponseBodyEntity>():
        await _isar.writeTxn(() async {
          await _roadmapLocalDataSource.refreshSteps(
            userId: userId,
            incomingSteps: result.data.data
                .map((e) => e.toLocal(userId: userId))
                .toList(),
          );
          savedCareer
            ..lastPage = page
            ..size = size
            ..stepsCount = result.data.paginationData.totalCount.toInt()
            ..percentageCompleted = result.data.percentageCompleted.toInt();
          await _careerLocalDataSource.upsertCareer(career: savedCareer);
        });
        return result;
      case OperationFailure<RoadmapStepsResponseBodyEntity>():
        if (result.failure is NoInternetFailure) {
          final steps = await _roadmapLocalDataSource.paginateRoadmapSteps(
            userId: userId,
            page: page,
            size: size,
          );
          if (steps.isNotEmpty) {
            final roadmapSteps = steps.map((e) => e.toEntity()).toList();
            return OperationSuccess<RoadmapStepsResponseBodyEntity>(
              RoadmapStepsResponseBodyEntity(
                data: roadmapSteps,
                paginationData: PaginationDataEntity(
                  currentPage: page,
                  size: size,
                  totalCount: savedCareer.stepsCount,
                  totalPages: (savedCareer.stepsCount / size).ceil(),
                ),
                percentageCompleted: savedCareer.percentageCompleted,
              ),
              warning: result.failure,
            );
          }
        }
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

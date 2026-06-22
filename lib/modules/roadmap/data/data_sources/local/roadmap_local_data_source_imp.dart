import 'package:injectable/injectable.dart' show Injectable;
import 'package:isar_community/isar.dart';

import '../../../../../core/layers/db/implementation/isar_base_repository.dart';
import '../../local_models/roadmap_step_local.dart';
import 'roadmap_local_data_source.dart';

@Injectable(as: RoadmapLocalDataSource)
class RoadmapLocalDataSourceImp extends IsarBaseRepository<RoadmapStepLocal>
    implements RoadmapLocalDataSource {
  RoadmapLocalDataSourceImp(super.isar, super.collection);

  @override
  Future<void> refreshSteps({
    required List<RoadmapStepLocal> incomingSteps,
    required String userId,
  }) async {
    final stepIds = incomingSteps.map((e) => e.stepId).toSet();
    final List<RoadmapStepLocal> baseStep = await localCollection
        .where()
        .userIdEqualTo(userId)
        .findAll();

    final existingSteps = baseStep
        .where((e) => stepIds.contains(e.stepId))
        .toList();

    final existingMap = {for (final step in existingSteps) step.stepId: step};

    for (final step in incomingSteps) {
      final existing = existingMap[step.stepId];

      if (existing != null) {
        step.id = existing.id;
      }
    }
    await isar.roadmapStepLocals.putAll(incomingSteps);
  }

  @override
  Future<List<RoadmapStepLocal>> paginateRoadmapSteps({
    required int page,
    required int size,
    required String userId,
  }) {
    return localCollection
        .filter()
        .userIdEqualTo(userId)
        .sortByOrder()
        .offset((page - 1) * size)
        .limit(size)
        .findAll();
  }

  @override
  Future<void> deleteRoadmapStepsOfUser({required String userId}) {
    return localCollection.where().userIdEqualTo(userId).deleteAll();
  }
}

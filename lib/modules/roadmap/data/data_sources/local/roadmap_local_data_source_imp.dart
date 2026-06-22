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
  Future<void> refreshSteps(List<RoadmapStepLocal> steps) async {
    await isar.writeTxn(() async {
      await localCollection.where().deleteAll();
      await localCollection.putAll(steps);
    });
  }

  @override
  Future<List<RoadmapStepLocal>> paginateRoadmapSteps({
    required int page,
    required int size,
  }) {
    return localCollection
        .where()
        .sortByOrder()
        .offset((page - 1) * size)
        .limit(size)
        .findAll();
  }
}

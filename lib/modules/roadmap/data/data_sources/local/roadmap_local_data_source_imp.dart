import 'package:injectable/injectable.dart' show Injectable;

import '../../../../../core/layers/db/implementation/isar_base_repository.dart';
import '../../local_models/roadmap_step_local.dart';
import 'roadmap_local_data_source.dart';

@Injectable(as: RoadmapLocalDataSource)
class RoadmapLocalDataSourceImp extends IsarBaseRepository<RoadmapStepLocal>
    implements RoadmapLocalDataSource {
  RoadmapLocalDataSourceImp(super.isar, super.collection);
}

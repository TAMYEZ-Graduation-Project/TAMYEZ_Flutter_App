import 'package:isar_community/isar.dart';

import '../../../../core/constants/app_enums.dart';

part 'roadmap_step_local.g.dart';

@collection
class RoadmapStepLocal {
  Id id = Isar.autoIncrement; // keep it ✅

  @Index()
  late String stepId;

  @Index()
  late String userId;

  @Index()
  late String careerId;

  @Index()
  late int order;

  @enumerated
  late RoadmapStepProgressStatusEnum progressStatus;

  late String title;
  late String description;
  late int v;
}

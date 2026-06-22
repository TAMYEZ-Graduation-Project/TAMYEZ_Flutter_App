import 'package:isar_community/isar.dart';

import '../../../../core/constants/app_enums.dart';

part 'roadmap_step_local.g.dart';

@collection
class RoadmapStepLocal {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String stepId;
  late int order;
  @enumerated
  late RoadmapStepProgressStatusEnum progressStatus;
  late String careerId;
  late String title;
  late String description;
  late String createdAt;
  late String updatedAt;
  late int v;
}

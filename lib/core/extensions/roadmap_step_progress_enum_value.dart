import '../constants/app_enums.dart';

extension RoadmapStepProgressEnumValue on String {
  RoadmapStepProgressStatusEnum? get toRoadmapStepProgressEnumValue {
    switch (this) {
      case 'Completed':
        return RoadmapStepProgressStatusEnum.completed;
      case 'InProgress':
        return RoadmapStepProgressStatusEnum.inProgress;
      case 'Available':
        return RoadmapStepProgressStatusEnum.available;
      case 'LockedPrereq':
        return RoadmapStepProgressStatusEnum.lockedPrereq;
      case 'DisabledFrozen':
        return RoadmapStepProgressStatusEnum.disabledFrozen;
      default:
        return null;
    }
  }
}

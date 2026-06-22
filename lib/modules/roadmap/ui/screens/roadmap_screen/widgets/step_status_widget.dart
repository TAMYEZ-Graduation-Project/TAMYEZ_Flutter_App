import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_enums.dart';
import '../../../../../../core/constants/asset_paths.dart';

class StepStatusWidget extends StatelessWidget {
  final RoadmapStepProgressStatusEnum status;

  const StepStatusWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.transparent,
      child: Image.asset(_iconPath()),
    );
  }

  String _iconPath() {
    switch (status) {
      case RoadmapStepProgressStatusEnum.completed:
        return AssetPaths.completedStepStatusIcon;
      case RoadmapStepProgressStatusEnum.inProgress:
        return AssetPaths.inProgressStepStatusIcon;
      case RoadmapStepProgressStatusEnum.available:
        return AssetPaths.availableStepStatusIcon;
      case RoadmapStepProgressStatusEnum.lockedPrereq:
        return AssetPaths.lockedPrereqStepStatusIcon;
      case RoadmapStepProgressStatusEnum.disabledFrozen:
        return AssetPaths.disabledFrozenStepStatusIcon;
    }
  }
}

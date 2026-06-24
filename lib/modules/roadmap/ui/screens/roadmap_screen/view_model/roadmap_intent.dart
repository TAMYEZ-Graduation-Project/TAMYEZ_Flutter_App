sealed class RoadmapIntent {
  const RoadmapIntent();
}

class GetUserCareerIntent extends RoadmapIntent {
  const GetUserCareerIntent();
}

class GetRoadmapStepsIntent extends RoadmapIntent {
  const GetRoadmapStepsIntent();
}

class ConvertAvailableStepToInProgressIntent extends RoadmapIntent {
  final String stepId;

  const ConvertAvailableStepToInProgressIntent({required this.stepId});
}

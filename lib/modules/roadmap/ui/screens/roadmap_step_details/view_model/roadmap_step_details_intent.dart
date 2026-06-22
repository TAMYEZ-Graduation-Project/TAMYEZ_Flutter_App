sealed class RoadmapStepDetailsIntent {
  const RoadmapStepDetailsIntent();
}

class GetRoadmapStepDetailsIntent extends RoadmapStepDetailsIntent {
  final String roadmapStepId;

  const GetRoadmapStepDetailsIntent({required this.roadmapStepId});
}

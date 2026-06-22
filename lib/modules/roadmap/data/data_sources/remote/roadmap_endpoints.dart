final class RoadmapEndpoints {
  static const String getUserCareer = 'career/';
  static const String getRoadmapSteps = 'roadmap/';
  static const String getRoadmapStepDetails =
      'roadmap/{${RoadmapApiKeys.roadmapStepId}}';
}

final class RoadmapApiKeys {
  static const String page = 'page';
  static const String size = 'size';
  static const String roadmapStepId = 'roadmapStepId';
}

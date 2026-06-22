import '../../../../career_assessment/data/models/career_details_response.dart';
import '../../models/roadmap_steps_response.dart';

abstract interface class RoadmapRemoteDataSource {
  Future<CareerDetailsResponse> getUserCareer();

  Future<RoadmapStepsResponse> getRoadmapSteps(int page, int size);
}

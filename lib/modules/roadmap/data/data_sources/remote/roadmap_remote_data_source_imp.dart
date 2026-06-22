import 'package:injectable/injectable.dart';

import '../../../../career_assessment/data/models/career_details_response.dart';
import '../../models/roadmap_step_details_response.dart';
import '../../models/roadmap_steps_response.dart';
import 'roadmap_api_client.dart';
import 'roadmap_remote_data_source.dart';

@Injectable(as: RoadmapRemoteDataSource)
class RoadmapRemoteDataSourceImp implements RoadmapRemoteDataSource {
  final RoadmapApiClient _apiClient;

  RoadmapRemoteDataSourceImp(this._apiClient);

  @override
  Future<CareerDetailsResponse> getUserCareer() {
    return _apiClient.getUserCareer();
  }

  @override
  Future<RoadmapStepsResponse> getRoadmapSteps(int page, int size) {
    return _apiClient.getRoadmapSteps(page, size);
  }

  @override
  Future<RoadmapStepDetailsResponse> getRoadmapStepDetails(
      String roadmapStepId) {
    return _apiClient.getRoadmapStepDetails(roadmapStepId);
  }
}

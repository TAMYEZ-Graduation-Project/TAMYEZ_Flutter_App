import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/network/dio/dio_constants.dart';
import '../../../../career_assessment/data/models/career_details_response.dart';
import '../../models/roadmap_steps_response.dart';
import 'roadmap_endpoints.dart';

part 'roadmap_api_client.g.dart';

@RestApi()
@lazySingleton
abstract class RoadmapApiClient {
  @FactoryMethod()
  factory RoadmapApiClient(@Named(DioNames.mainDio) Dio dio) =
      _RoadmapApiClient;

  @GET(RoadmapEndpoints.getUserCareer)
  @Extra({DioKeys.requiresAuth: true})
  Future<CareerDetailsResponse> getUserCareer();

  @GET(RoadmapEndpoints.getRoadmapSteps)
  @Extra({DioKeys.requiresAuth: true})
  Future<RoadmapStepsResponse> getRoadmapSteps(
    @Query(RoadmapApiKeys.page) int page,
    @Query(RoadmapApiKeys.size) int size,
  );
}

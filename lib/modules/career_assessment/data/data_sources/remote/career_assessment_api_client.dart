import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/dio.dart' show Extra;
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/network/dio/dio_constants.dart';
import '../../../../../core/network/models/get_quiz_questions_response.dart';
import 'career_assessment_endpoints.dart';

part 'career_assessment_api_client.g.dart';

@RestApi()
@lazySingleton
abstract class CareerAssessmentApiClient {
  @FactoryMethod()
  factory CareerAssessmentApiClient(@Named(DioNames.mainDio) Dio dio) =
      _CareerAssessmentApiClient;

  @GET(CareerAssessmentEndpoints.getCareerAssessmentQuestions)
  @Extra({DioKeys.requiresAuth: true})
  Future<GetQuizQuestionsResponseDto> getCareerAssessmentQuestions(
    @Query(CareerAssessmentQueryParams.discardActiveAttempt)
    bool discardActiveAttempt,
  );
}

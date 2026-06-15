import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/network/dio/dio_constants.dart';
import '../../../../../core/network/models/get_quiz_questions_response.dart';
import 'career_assessment_endpoints.dart' show CareerAssessmentEndpoints;

part 'career_assessment_api_client.g.dart';

@RestApi()
abstract class CareerAssessmentApiClient {
  factory CareerAssessmentApiClient(@Named(DioNames.mainDio) Dio dio) =
      _CareerAssessmentApiClient;

  @GET(CareerAssessmentEndpoints.getCareerAssessmentQuestions)
  Future<GetQuizQuestionsResponseDto> getCareerAssessmentQuestions();
}

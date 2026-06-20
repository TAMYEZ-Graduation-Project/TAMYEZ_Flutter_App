import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart'
    show FactoryMethod, lazySingleton, Named;
import 'package:retrofit/dio.dart' show Extra;
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/network/dio/dio_constants.dart';
import '../../../../../core/network/models/check_question_answers_request.dart'
    show CheckQuestionAnswersRequest;
import '../../../../../core/network/models/get_quiz_questions_response.dart';
import '../../models/career_details_response.dart';
import '../../models/check_career_assessment_answers_response.dart';
import '../../models/choose_suggested_career_response.dart';
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
    @Query(CareerAssessmentApiParams.discardActiveAttempt)
    bool discardActiveAttempt,
  );

  @POST(CareerAssessmentEndpoints.checkCareerAssessmentAnswers)
  @Extra({DioKeys.requiresAuth: true})
  Future<CheckCareerAssessmentAnswersResponse> checkCareerAssessmentAnswers(
    @Path(CareerAssessmentApiParams.quizAttemptId) String quizAttemptId,
    @Body() CheckQuestionAnswersRequest request,
  );

  @GET(CareerAssessmentEndpoints.chooseSuggestedCareer)
  @Extra({DioKeys.requiresAuth: true})
  Future<ChooseSuggestedCareerResponse> chooseSuggestedCareer(
    @Path(CareerAssessmentApiParams.suggestedCareerId) String suggestedCareerId,
  );

  @GET(CareerAssessmentEndpoints.getCareerDetails)
  Future<CareerDetailsResponse> getCareerDetails(
    @Path(CareerAssessmentApiParams.careerId) String careerId,
  );
}

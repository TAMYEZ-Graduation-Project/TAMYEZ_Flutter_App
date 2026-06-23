import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/network/dio/dio_constants.dart';
import '../../../../../core/network/models/check_question_answers_request.dart';
import '../../../../../core/network/models/get_quiz_questions_response.dart';
import '../../models/quiz_result_response.dart';
import 'quiz_api_endpoints.dart';

part 'quiz_api_client.g.dart';

@RestApi()
@lazySingleton
abstract class QuizApiClient {
  @FactoryMethod()
  factory QuizApiClient(@Named(DioNames.mainDio) Dio dio) = _QuizApiClient;

  @GET(QuizApiEndpoints.getQuizQuestions)
  @Extra({DioKeys.requiresAuth: true})
  Future<GetQuizQuestionsResponseDto> getQuizQuestions(
    @Query(QuizApiParams.discardActiveAttempt) bool discardActiveAttempt,
    @Path(QuizApiParams.quizId) String quizId,
    @Path(QuizApiParams.roadmapStepId) String roadmapStepId,
  );

  @POST(QuizApiEndpoints.checkQuizAnswers)
  @Extra({DioKeys.requiresAuth: true})
  Future<QuizResultResponseDto> checkQuizAnswers(
    @Path(QuizApiParams.quizAttemptId) String quizAttemptId,
    @Body() CheckQuestionAnswersRequest request,
  );
}

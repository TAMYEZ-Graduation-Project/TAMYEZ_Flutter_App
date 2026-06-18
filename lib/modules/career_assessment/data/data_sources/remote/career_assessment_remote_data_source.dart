import '../../../../../core/network/models/check_question_answers_request.dart';
import '../../../../../core/network/models/get_quiz_questions_response.dart';
import '../../../../../core/network/models/simple_api_response.dart';
import '../../models/check_career_assessment_answers_response.dart';

abstract interface class CareerAssessmentRemoteDataSource {
  Future<GetQuizQuestionsResponseDto> getCareerAssessmentQuestions();

  Future<CheckCareerAssessmentAnswersResponse> checkCareerAssessmentAnswers({
    required String quizAttemptId,
    required CheckQuestionAnswersRequest request,
  });

  Future<SimpleApiResponse> chooseSuggestedCareer(
      {required String suggestedCareerId});
}

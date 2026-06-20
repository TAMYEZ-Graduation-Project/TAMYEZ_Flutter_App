import '../../../../../core/network/models/check_question_answers_request.dart';
import '../../../../../core/network/models/get_quiz_questions_response.dart';
import '../../models/career_details_response.dart';
import '../../models/check_career_assessment_answers_response.dart';
import '../../models/choose_suggested_career_response.dart';

abstract interface class CareerAssessmentRemoteDataSource {
  Future<GetQuizQuestionsResponseDto> getCareerAssessmentQuestions();

  Future<CheckCareerAssessmentAnswersResponse> checkCareerAssessmentAnswers({
    required String quizAttemptId,
    required CheckQuestionAnswersRequest request,
  });

  Future<ChooseSuggestedCareerResponse> chooseSuggestedCareer({
    required String suggestedCareerId,
  });

  Future<CareerDetailsResponse> getCareerDetails({required String careerId});
}

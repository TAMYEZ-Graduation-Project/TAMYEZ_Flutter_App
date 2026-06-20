import '../../../../core/entities/career_entity.dart';
import '../../../../core/entities/check_question_answers_param.dart';
import '../../../../core/entities/get_quiz_questions_entity.dart';
import '../../../../core/entities/user_entity.dart';
import '../../../../core/execution/operation_result.dart';
import '../entities/check_career_assessment_answers_response_entity.dart'
    show SuggestedCareerEntity;

abstract interface class CareerAssessmentRepo {
  Future<OperationResult<QuizAttemptEntity>> getCareerAssessmentQuestions();

  Future<OperationResult<List<SuggestedCareerEntity>>>
  checkCareerAssessmentAnswers({
    required String quizAttemptId,
    required CheckQuestionAnswersParams params,
  });

  Future<OperationResult<UserEntity>> chooseSuggestedCareer({
    required String suggestedCareerId,
  });

  Future<OperationResult<CareerEntity>> getCareerDetails({
    required String careerId,
  });
}

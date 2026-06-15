import '../../../../core/entities/get_quiz_questions_entity.dart';
import '../../../../core/execution/operation_result.dart';

abstract interface class CareerAssessmentRepo {
  Future<OperationResult<QuizAttemptEntity>> getCareerAssessmentQuestions();
}

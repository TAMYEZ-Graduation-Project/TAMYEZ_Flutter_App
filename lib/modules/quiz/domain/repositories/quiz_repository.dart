import '../../../../core/entities/check_question_answers_param.dart';
import '../../../../core/entities/get_quiz_questions_entity.dart';
import '../../../../core/execution/operation_result.dart';
import '../entities/get_saved_quiz_entity.dart';
import '../entities/quiz_result_response_entity.dart';
import '../entities/saved_quizzes_entity.dart';

abstract interface class QuizRepository {
  Future<OperationResult<QuizAttemptEntity>> getQuizQuestions({
    required String quizId,
    required String roadmapStepId,
  });

  Future<OperationResult<QuizResultEntity>> checkQuizAnswers({
    required String quizAttemptId,
    required CheckQuestionAnswersParams params,
  });

  Future<OperationResult<SavedQuizzesPaginationEntity>> getSavedQuizzes({
    required String userId,
    required int page,
    required int size,
  });

  Future<OperationResult<SavedQuizDetailsEntity>> getSavedQuiz({
    required String savedQuizId,
  });
}

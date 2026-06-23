import '../../../../../core/network/models/check_question_answers_request.dart';
import '../../../../../core/network/models/get_quiz_questions_response.dart';
import '../../models/quiz_result_response.dart';
import '../../models/saved_quizzes_response.dart';

abstract interface class QuizRemoteDataSource {
  Future<GetQuizQuestionsResponseDto> getQuizQuestions({
    required String quizId,
    required String roadmapStepId,
  });

  Future<QuizResultResponseDto> checkQuizAnswers({
    required String quizAttemptId,
    required CheckQuestionAnswersRequest request,
  });

  Future<SavedQuizzesResponseDto> getSavedQuizzes({
    required int page,
    required int size,
  });
}

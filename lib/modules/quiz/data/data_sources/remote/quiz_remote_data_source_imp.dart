import 'package:injectable/injectable.dart';

import '../../../../../core/network/models/check_question_answers_request.dart';
import '../../../../../core/network/models/get_quiz_questions_response.dart';
import '../../models/quiz_result_response.dart';
import '../../models/saved_quizzes_response.dart';
import 'quiz_api_client.dart';
import 'quiz_remote_data_source.dart';

@Injectable(as: QuizRemoteDataSource)
class QuizRemoteDataSourceImp implements QuizRemoteDataSource {
  final QuizApiClient _apiClient;

  const QuizRemoteDataSourceImp(this._apiClient);

  @override
  Future<GetQuizQuestionsResponseDto> getQuizQuestions({
    required String quizId,
    required String roadmapStepId,
  }) {
    return _apiClient.getQuizQuestions(true, quizId, roadmapStepId);
  }

  @override
  Future<QuizResultResponseDto> checkQuizAnswers({
    required String quizAttemptId,
    required CheckQuestionAnswersRequest request,
  }) {
    return _apiClient.checkQuizAnswers(quizAttemptId, request);
  }

  @override
  Future<SavedQuizzesResponseDto> getSavedQuizzes({
    required int page,
    required int size,
  }) {
    return _apiClient.getSavedQuizzes(page, size);
  }
}

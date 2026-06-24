import 'package:injectable/injectable.dart';

import '../../../../core/entities/check_question_answers_param.dart';
import '../../../../core/entities/get_quiz_questions_entity.dart';
import '../../../../core/execution/operation_result.dart';
import '../../../../core/mappers/base_quiz_mapper.dart';
import '../../../../core/utils/functions/repo_result_handler.dart';
import '../../domain/entities/get_saved_quiz_entity.dart';
import '../../domain/entities/quiz_result_response_entity.dart';
import '../../domain/entities/saved_quizzes_entity.dart';
import '../../domain/repositories/quiz_repository.dart';
import '../data_sources/remote/quiz_remote_data_source.dart';
import '../mappers/quiz_mappers.dart';

@Injectable(as: QuizRepository)
class QuizRepositoryImp implements QuizRepository {
  final QuizRemoteDataSource _remoteDataSource;

  const QuizRepositoryImp(this._remoteDataSource);

  @override
  Future<OperationResult<QuizAttemptEntity>> getQuizQuestions({
    required String quizId,
    required String roadmapStepId,
  }) {
    return repoResultHandler(() async {
      return (await _remoteDataSource.getQuizQuestions(
        quizId: quizId,
        roadmapStepId: roadmapStepId,
      )).toEntity().body.quizAttempt;
    });
  }

  @override
  Future<OperationResult<QuizResultEntity>> checkQuizAnswers({
    required String quizAttemptId,
    required CheckQuestionAnswersParams params,
  }) {
    return repoResultHandler(() async {
      return (await _remoteDataSource.checkQuizAnswers(
        quizAttemptId: quizAttemptId,
        request: params.toModel(),
      )).toEntity().body;
    });
  }

  @override
  Future<OperationResult<SavedQuizzesPaginationEntity>> getSavedQuizzes({
    required int page,
    required int size,
  }) {
    return repoResultHandler(() async {
      return (await _remoteDataSource.getSavedQuizzes(
        page: page,
        size: size,
      )).toEntity().body.savedQuizzes;
    });
  }

  @override
  Future<OperationResult<SavedQuizDetailsEntity>> getSavedQuiz({
    required String savedQuizId,
  }) {
    return repoResultHandler(() async {
      return (await _remoteDataSource.getSavedQuiz(
        savedQuizId: savedQuizId,
      )).toEntity().body.savedQuiz;
    });
  }
}

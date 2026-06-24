import 'dart:math' show max;

import 'package:injectable/injectable.dart';
import 'package:isar_community/isar.dart';

import '../../../../core/entities/check_question_answers_param.dart';
import '../../../../core/entities/get_quiz_questions_entity.dart';
import '../../../../core/error/failures/app_failures.dart';
import '../../../../core/execution/operation_result.dart';
import '../../../../core/mappers/base_quiz_mapper.dart';
import '../../../../core/utils/functions/repo_result_handler.dart';
import '../../domain/entities/get_saved_quiz_entity.dart';
import '../../domain/entities/quiz_result_response_entity.dart';
import '../../domain/entities/saved_quizzes_entity.dart';
import '../../domain/repositories/quiz_repository.dart';
import '../data_sources/local/saved_quiz_local_data_source.dart';
import '../data_sources/local/saved_quizzes_pagination_local_data_source.dart';
import '../data_sources/remote/quiz_remote_data_source.dart';
import '../mappers/quiz_mappers.dart';

@Injectable(as: QuizRepository)
class QuizRepositoryImp implements QuizRepository {
  final QuizRemoteDataSource _remoteDataSource;
  final Isar _isar;
  final SavedQuizzesPaginationLocalDataSource
  _savedQuizzesPaginationLocalDataSource;
  final SavedQuizLocalDataSource _savedQuizLocalDataSource;

  const QuizRepositoryImp(
    this._remoteDataSource,
    this._isar,
    this._savedQuizzesPaginationLocalDataSource,
    this._savedQuizLocalDataSource,
  );

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
    required String userId,
    required int page,
    required int size,
  }) async {
    final result = await repoResultHandler(() async {
      return (await _remoteDataSource.getSavedQuizzes(
        page: page,
        size: size,
      )).toEntity().body.savedQuizzes;
    });

    switch (result) {
      case OperationSuccess<SavedQuizzesPaginationEntity>():
        final savedQuizzesPagination =
            await _savedQuizzesPaginationLocalDataSource.findByUserId(
              userId: userId,
            );
        await _isar.writeTxn(() async {
          if (savedQuizzesPagination == null &&
              (await _savedQuizzesPaginationLocalDataSource
                      .savedQuizzesPaginationCount() >=
                  2)) {
            final userOfDeletedPaginatedQuizzesData =
                await _savedQuizzesPaginationLocalDataSource
                    .deletedOldestSavedQuizzesPagination();
            if (userOfDeletedPaginatedQuizzesData != null) {
              await _savedQuizLocalDataSource.deleteSavedQuizzesOfUser(
                userId: userOfDeletedPaginatedQuizzesData,
              );
            }
          }
          await _savedQuizzesPaginationLocalDataSource
              .upsertSavedQuizzesPagination(
                savedQuizzesPagination: result.data.toLocal(
                  userId: userId,
                  currentPage: max(
                    savedQuizzesPagination?.paginationData.currentPage ?? 1,
                    page,
                  ),
                ),
              );
          await _savedQuizLocalDataSource.refreshSavedQuizzes(
            userId: userId,
            incomingSavedQuizzes: result.data.data
                .map((e) => e.toLocal(userId: userId))
                .toList(),
          );
        });
        return result;
      case OperationFailure<SavedQuizzesPaginationEntity>():
        if (result.failure is NoInternetFailure) {
          final savedQuizzesPagination =
              await _savedQuizzesPaginationLocalDataSource.findByUserId(
                userId: userId,
              );
          if (savedQuizzesPagination != null) {
            final savedQuizzes = await _savedQuizLocalDataSource
                .paginateSavedQuizzes(userId: userId, page: page, size: size);
            final newSavedQuizzesPagination = savedQuizzesPagination.toEntity(
              data: savedQuizzes,
            );
            return OperationSuccess<SavedQuizzesPaginationEntity>(
              newSavedQuizzesPagination,
              warning: result.failure,
            );
          }
        }
        return result;
    }
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

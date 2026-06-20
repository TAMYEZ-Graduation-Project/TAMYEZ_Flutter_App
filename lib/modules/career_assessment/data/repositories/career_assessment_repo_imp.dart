import 'dart:convert';

import 'package:injectable/injectable.dart' show Injectable, Named;

import '../../../../core/entities/career_entity.dart';
import '../../../../core/entities/check_question_answers_param.dart';
import '../../../../core/entities/get_quiz_questions_entity.dart';
import '../../../../core/entities/user_entity.dart';
import '../../../../core/error/exceptions/app_exceptions.dart'
    show
        QuizBadResponseException,
        CheckCareerAssessmentAnswersBadResponseException;
import '../../../../core/execution/operation_result.dart';
import '../../../../core/layers/storage/constants/storage_constants.dart';
import '../../../../core/layers/storage/contracts/storage_service_contract.dart';
import '../../../../core/mappers/base_quiz_mapper.dart';
import '../../../../core/utils/functions/repo_result_handler.dart';
import '../../domain/entities/check_career_assessment_answers_response_entity.dart';
import '../../domain/repositories/career_assessment_repo.dart'
    show CareerAssessmentRepo;
import '../data_sources/remote/career_assessment_remote_data_source.dart'
    show CareerAssessmentRemoteDataSource;
import '../mappers/career_assessment_mapper.dart';

@Injectable(as: CareerAssessmentRepo)
class CareerAssessmentRepoImp implements CareerAssessmentRepo {
  final CareerAssessmentRemoteDataSource _remoteDataSource;
  final StorageService _storageService;

  const CareerAssessmentRepoImp(
    this._remoteDataSource,
    @Named(StorageConstants.secureStorage) this._storageService,
  );

  @override
  Future<OperationResult<QuizAttemptEntity>> getCareerAssessmentQuestions() {
    return repoResultHandler(() async {
      final response = await _remoteDataSource.getCareerAssessmentQuestions();
      if (response.body?.quizAttempt == null ||
          response.body?.quizAttempt?.id == null) {
        throw const QuizBadResponseException();
      }
      return response.toEntity().body.quizAttempt;
    });
  }

  @override
  Future<OperationResult<List<SuggestedCareerEntity>>>
  checkCareerAssessmentAnswers({
    required String quizAttemptId,
    required CheckQuestionAnswersParams params,
  }) {
    return repoResultHandler(() async {
      final response = await _remoteDataSource.checkCareerAssessmentAnswers(
        quizAttemptId: quizAttemptId,
        request: params.toModel(),
      );
      if (response.body == null || response.body?.isEmpty == true) {
        throw const CheckCareerAssessmentAnswersBadResponseException();
      }

      return response.toEntity().body;
    });
  }

  @override
  Future<OperationResult<UserEntity>> chooseSuggestedCareer({
    required String suggestedCareerId,
  }) {
    return repoResultHandler(() async {
      final response = await _remoteDataSource.chooseSuggestedCareer(
        suggestedCareerId: suggestedCareerId,
      );

      if (response.body?.user == null) {
        throw const QuizBadResponseException();
      }
      _storageService.setString(
        StorageConstants.userKey,
        jsonEncode(response.body!.user),
      );

      return response.toEntity().body.user;
    });
  }

  @override
  Future<OperationResult<CareerEntity>> getCareerDetails({
    required String careerId,
  }) {
    return repoResultHandler(() async {
      final response = await _remoteDataSource.getCareerDetails(
        careerId: careerId,
      );

      return response.toEntity().body;
    });
  }
}

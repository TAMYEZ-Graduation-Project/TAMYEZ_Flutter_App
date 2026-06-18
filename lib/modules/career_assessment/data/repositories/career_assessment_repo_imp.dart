import 'package:injectable/injectable.dart' show Injectable;

import '../../../../core/entities/check_question_answers_param.dart';
import '../../../../core/entities/get_quiz_questions_entity.dart';
import '../../../../core/error/exceptions/app_exceptions.dart'
    show
        QuizBadResponseException,
        CheckCareerAssessmentAnswersBadResponseException;
import '../../../../core/execution/operation_result.dart';
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

  const CareerAssessmentRepoImp(this._remoteDataSource);

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

      if (response.body?.suggestedCareers == null ||
          response.body?.suggestedCareers?.isEmpty == true) {
        throw const CheckCareerAssessmentAnswersBadResponseException();
      }

      return response.toEntity().body.suggestedCareers;
    });
  }

  @override
  Future<OperationResult<void>> chooseSuggestedCareer({
    required String suggestedCareerId,
  }) {
    return repoResultHandler(
      () => _remoteDataSource.chooseSuggestedCareer(
        suggestedCareerId: suggestedCareerId,
      ),
    );
  }
}

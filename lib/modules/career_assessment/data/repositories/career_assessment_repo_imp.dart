import 'package:injectable/injectable.dart' show Injectable;

import '../../../../core/entities/get_quiz_questions_entity.dart';
import '../../../../core/error/exceptions/app_exceptions.dart'
    show QuizBadResponseException;
import '../../../../core/execution/operation_result.dart';
import '../../../../core/mappers/base_quiz_mapper.dart';
import '../../../../core/utils/functions/repo_result_handler.dart';
import '../../domain/repositories/career_assessment_repo.dart'
    show CareerAssessmentRepo;
import '../data_sources/remote/career_assessment_remote_data_source.dart'
    show CareerAssessmentRemoteDataSource;

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
}

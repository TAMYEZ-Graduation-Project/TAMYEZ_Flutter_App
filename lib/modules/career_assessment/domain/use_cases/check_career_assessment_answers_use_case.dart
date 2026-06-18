import 'package:injectable/injectable.dart' show injectable;

import '../../../../core/entities/check_question_answers_param.dart'
    show CheckQuestionAnswersParams;
import '../../../../core/execution/operation_result.dart' show OperationResult;
import '../entities/check_career_assessment_answers_response_entity.dart'
    show SuggestedCareerEntity;
import '../repositories/career_assessment_repo.dart' show CareerAssessmentRepo;

@injectable
class CheckCareerAssessmentAnswersUseCase {
  final CareerAssessmentRepo _repo;

  const CheckCareerAssessmentAnswersUseCase(this._repo);

  Future<OperationResult<List<SuggestedCareerEntity>>> call({
    required String quizAttemptId,
    required CheckQuestionAnswersParams params,
  }) {
    return _repo.checkCareerAssessmentAnswers(
      quizAttemptId: quizAttemptId,
      params: params,
    );
  }
}

import 'package:injectable/injectable.dart';

import '../../../../core/entities/get_quiz_questions_entity.dart';
import '../../../../core/execution/operation_result.dart';
import '../repositories/career_assessment_repo.dart';

@injectable
class GetCareerAssessmentQuestions {
  final CareerAssessmentRepo _repo;

  const GetCareerAssessmentQuestions(this._repo);

  Future<OperationResult<QuizAttemptEntity>> call() {
    return _repo.getCareerAssessmentQuestions();
  }
}

import 'package:injectable/injectable.dart';

import '../../../../core/entities/check_question_answers_param.dart';
import '../../../../core/execution/operation_result.dart';
import '../entities/quiz_result_response_entity.dart';
import '../repositories/quiz_repository.dart';

@injectable
class CheckQuizAnswersUseCase {
  final QuizRepository _repository;

  const CheckQuizAnswersUseCase(this._repository);

  Future<OperationResult<QuizResultEntity>> call({
    required String quizAttemptId,
    required CheckQuestionAnswersParams params,
  }) {
    return _repository.checkQuizAnswers(
      quizAttemptId: quizAttemptId,
      params: params,
    );
  }
}

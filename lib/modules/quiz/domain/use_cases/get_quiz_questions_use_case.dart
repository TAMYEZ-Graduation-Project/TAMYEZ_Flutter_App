import 'package:injectable/injectable.dart' show injectable;

import '../../../../core/entities/get_quiz_questions_entity.dart'
    show QuizAttemptEntity;
import '../../../../core/execution/operation_result.dart';
import '../repositories/quiz_repository.dart';

@injectable
class GetQuizQuestionsUseCase {
  final QuizRepository _repository;

  const GetQuizQuestionsUseCase(this._repository);

  Future<OperationResult<QuizAttemptEntity>> call({
    required String quizId,
    required String roadmapStepId,
  }) {
    return _repository.getQuizQuestions(
      quizId: quizId,
      roadmapStepId: roadmapStepId,
    );
  }
}

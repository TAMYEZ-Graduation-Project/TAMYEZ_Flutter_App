import 'package:injectable/injectable.dart';

import '../../../../core/execution/operation_result.dart';
import '../entities/get_saved_quiz_entity.dart';
import '../repositories/quiz_repository.dart';

@injectable
class GetSavedQuizUseCase {
  final QuizRepository _repository;

  const GetSavedQuizUseCase(this._repository);

  Future<OperationResult<SavedQuizDetailsEntity>> call({
    required String savedQuizId,
  }) {
    return _repository.getSavedQuiz(savedQuizId: savedQuizId);
  }
}

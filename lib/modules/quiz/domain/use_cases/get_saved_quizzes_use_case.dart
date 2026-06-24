import 'package:injectable/injectable.dart';

import '../../../../core/execution/operation_result.dart';
import '../entities/saved_quizzes_entity.dart';
import '../repositories/quiz_repository.dart';

@injectable
class GetSavedQuizzesUseCase {
  final QuizRepository _repository;

  const GetSavedQuizzesUseCase(this._repository);

  Future<OperationResult<SavedQuizzesPaginationEntity>> call({
    required String userId,
    required int page,
    required int size,
  }) {
    return _repository.getSavedQuizzes(userId: userId, page: page, size: size);
  }
}

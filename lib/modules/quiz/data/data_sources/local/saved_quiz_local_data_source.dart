import '../../../../../core/layers/db/contracts/db_base_repository.dart';
import '../../local_models/saved_quiz_local.dart';

abstract interface class SavedQuizLocalDataSource
    implements DbBaseRepository<SavedQuizLocal> {
  Future<void> refreshSavedQuizzes({
    required List<SavedQuizLocal> incomingSavedQuizzes,
    required String userId,
  });

  Future<List<SavedQuizLocal>> paginateSavedQuizzes({
    required int page,
    required int size,
    required String userId,
  });

  Future<void> deleteSavedQuizzesOfUser({required String userId});
}

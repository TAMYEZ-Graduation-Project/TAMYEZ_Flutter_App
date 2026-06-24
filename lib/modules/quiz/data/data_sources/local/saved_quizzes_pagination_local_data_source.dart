import '../../../../../core/layers/db/contracts/db_base_repository.dart';
import '../../local_models/saved_quizzes_pagination_local.dart';

abstract interface class SavedQuizzesPaginationLocalDataSource
    implements DbBaseRepository<SavedQuizzesPaginationLocal> {
  Future<SavedQuizzesPaginationLocal?> findByUserId({required String userId});

  Future<void> upsertSavedQuizzesPagination({
    required SavedQuizzesPaginationLocal savedQuizzesPagination,
  });

  Future<int> savedQuizzesPaginationCount();

  Future<String?> deletedOldestSavedQuizzesPagination();
}

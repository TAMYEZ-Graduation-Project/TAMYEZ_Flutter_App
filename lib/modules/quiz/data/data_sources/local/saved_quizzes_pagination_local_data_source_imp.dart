import 'package:injectable/injectable.dart';
import 'package:isar_community/isar.dart';

import '../../../../../core/layers/db/implementation/isar_base_repository.dart';
import '../../local_models/saved_quizzes_pagination_local.dart';
import 'saved_quizzes_pagination_local_data_source.dart';

@Injectable(as: SavedQuizzesPaginationLocalDataSource)
class SavedQuizzesPaginationLocalDataSourceImp
    extends IsarBaseRepository<SavedQuizzesPaginationLocal>
    implements SavedQuizzesPaginationLocalDataSource {
  SavedQuizzesPaginationLocalDataSourceImp(super.isar, super.localCollection);

  @override
  Future<SavedQuizzesPaginationLocal?> findByUserId({required String userId}) {
    return localCollection.filter().userIdEqualTo(userId).findFirst();
  }

  @override
  Future<void> upsertSavedQuizzesPagination({
    required SavedQuizzesPaginationLocal savedQuizzesPagination,
  }) async {
    final existing = await localCollection
        .filter()
        .userIdEqualTo(savedQuizzesPagination.userId)
        .findFirst();
    if (existing != null) {
      savedQuizzesPagination.id = existing.id;
    }
    await localCollection.put(savedQuizzesPagination);
  }

  @override
  Future<int> savedQuizzesPaginationCount() {
    return localCollection.where().count();
  }

  @override
  Future<String?> deletedOldestSavedQuizzesPagination() {
    return localCollection.where().sortBySavedAt().limit(1).findFirst().then((
      value,
    ) {
      if (value != null) {
        localCollection.delete(value.id);
      }
      return value?.userId;
    });
  }
}

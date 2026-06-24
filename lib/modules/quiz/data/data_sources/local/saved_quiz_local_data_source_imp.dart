import 'package:injectable/injectable.dart';
import 'package:isar_community/isar.dart';

import '../../../../../core/layers/db/implementation/isar_base_repository.dart';
import '../../local_models/saved_quiz_local.dart';
import 'saved_quiz_local_data_source.dart';

@Injectable(as: SavedQuizLocalDataSource)
class SavedQuizLocalDataSourceImp extends IsarBaseRepository<SavedQuizLocal>
    implements SavedQuizLocalDataSource {
  SavedQuizLocalDataSourceImp(super.isar, super.localCollection);

  @override
  Future<void> refreshSavedQuizzes({
    required List<SavedQuizLocal> incomingSavedQuizzes,
    required String userId,
  }) async {
    final savedQuizzesIds = incomingSavedQuizzes
        .map((e) => e.savedQuizId)
        .toSet();
    final List<SavedQuizLocal> baseStep = await localCollection
        .where()
        .userIdEqualTo(userId)
        .findAll();

    final existingSteps = baseStep
        .where((e) => savedQuizzesIds.contains(e.savedQuizId))
        .toList();

    final existingMap = {
      for (final savedQuiz in existingSteps) savedQuiz.savedQuizId: savedQuiz,
    };

    for (final savedQuiz in incomingSavedQuizzes) {
      final existing = existingMap[savedQuiz.savedQuizId];

      if (existing != null) {
        savedQuiz.id = existing.id;
      }
    }
    await isar.savedQuizLocals.putAll(incomingSavedQuizzes);
  }

  @override
  Future<List<SavedQuizLocal>> paginateSavedQuizzes({
    required int page,
    required int size,
    required String userId,
  }) {
    return localCollection
        .filter()
        .userIdEqualTo(userId)
        .sortByTakenAt()
        .offset((page - 1) * size)
        .limit(size)
        .findAll();
  }

  @override
  Future<void> deleteSavedQuizzesOfUser({required String userId}) {
    return localCollection.where().userIdEqualTo(userId).deleteAll();
  }
}

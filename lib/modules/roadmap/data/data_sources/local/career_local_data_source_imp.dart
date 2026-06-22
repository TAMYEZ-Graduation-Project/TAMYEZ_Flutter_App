import 'package:injectable/injectable.dart' show Injectable;
import 'package:isar_community/isar.dart';

import '../../../../../core/layers/db/implementation/isar_base_repository.dart';
import '../../local_models/career_local.dart';
import 'career_local_data_source.dart';

@Injectable(as: CareerLocalDataSource)
class CareerLocalDataSourceImp extends IsarBaseRepository<CareerLocal>
    implements CareerLocalDataSource {
  CareerLocalDataSourceImp(super.isar, super.collection);

  @override
  Future<CareerLocal?> findByUserId({required String userId}) {
    return localCollection.filter().userIdEqualTo(userId).findFirst();
  }

  @override
  Future<void> upsertCareer({required CareerLocal career}) async {
    final existing = await localCollection
        .filter()
        .userIdEqualTo(career.userId)
        .findFirst();
    if (existing != null) {
      career.id = existing.id;
    }
    await localCollection.put(career);
  }

  @override
  Future<int> careersCount() {
    return localCollection.where().count();
  }

  @override
  Future<String?> deletedOldestCareer() {
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

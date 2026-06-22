import '../../../../../core/layers/db/contracts/db_base_repository.dart';
import '../../local_models/career_local.dart';

abstract interface class CareerLocalDataSource
    implements DbBaseRepository<CareerLocal> {
  Future<int> careersCount();

  Future<CareerLocal?> findByUserId({required String userId});

  Future<void> upsertCareer({required CareerLocal career});

  Future<String?> deletedOldestCareer();
}

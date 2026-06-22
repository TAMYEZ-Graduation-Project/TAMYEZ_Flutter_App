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
  Future<CareerLocal?> findByCareerId({required String careerId}) {
    return localCollection.filter().careerIdEqualTo(careerId).findFirst();
  }
}

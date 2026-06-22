import 'package:injectable/injectable.dart'
    show module, preResolve, lazySingleton;
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;

import '../../../../modules/roadmap/data/local_models/career_local.dart';
import '../../../../modules/roadmap/data/local_models/roadmap_step_local.dart';
import '../models/email/email_model.dart';

@module
abstract class DbInitializer {
  @preResolve
  Future<Isar> initIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open([
      EmailSchema,
      CareerLocalSchema,
      RoadmapStepLocalSchema,
    ], directory: dir.path);
  }

  @lazySingleton
  IsarCollection<CareerLocal> careerCollection(Isar isar) =>
      isar.collection<CareerLocal>();

  @lazySingleton
  IsarCollection<RoadmapStepLocal> roadmapCollection(Isar isar) =>
      isar.collection<RoadmapStepLocal>();
}

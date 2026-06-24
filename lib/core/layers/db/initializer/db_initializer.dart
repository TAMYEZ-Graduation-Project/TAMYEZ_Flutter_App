import 'package:injectable/injectable.dart'
    show module, preResolve, lazySingleton;
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;

import '../../../../modules/quiz/data/local_models/saved_quiz_local.dart';
import '../../../../modules/quiz/data/local_models/saved_quizzes_pagination_local.dart';
import '../../../../modules/roadmap/data/local_models/career_local.dart';
import '../../../../modules/roadmap/data/local_models/roadmap_step_local.dart';

@module
abstract class DbInitializer {
  @preResolve
  Future<Isar> initIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open([
      CareerLocalSchema,
      RoadmapStepLocalSchema,
      SavedQuizzesPaginationLocalSchema,
      SavedQuizLocalSchema,
    ], directory: dir.path);
  }

  @lazySingleton
  IsarCollection<CareerLocal> careerCollection(Isar isar) =>
      isar.collection<CareerLocal>();

  @lazySingleton
  IsarCollection<RoadmapStepLocal> roadmapCollection(Isar isar) =>
      isar.collection<RoadmapStepLocal>();

  @lazySingleton
  IsarCollection<SavedQuizzesPaginationLocal> savedQuizzesPaginationCollection(
      Isar isar) =>
      isar.collection<SavedQuizzesPaginationLocal>();

  @lazySingleton
  IsarCollection<SavedQuizLocal> savedQuizCollection(Isar isar) =>
      isar.collection<SavedQuizLocal>();
}

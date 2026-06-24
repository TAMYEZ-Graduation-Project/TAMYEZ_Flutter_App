import 'package:isar_community/isar.dart';

import 'quiz_local.dart';

part 'saved_quiz_local.g.dart';

@collection
class SavedQuizLocal {
  Id id = Isar.autoIncrement;
  @Index()
  late String savedQuizId;
  @Index()
  late String userId;
  late QuizLocal quizId;
  late String score;
  late String takenAt;
}

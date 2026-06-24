import 'package:isar_community/isar.dart';

import 'pagination_data_local.dart';

part 'saved_quizzes_pagination_local.g.dart';

@collection
class SavedQuizzesPaginationLocal {
  Id id = Isar.autoIncrement;
  late PaginationDataLocal paginationData;
  @Index(type: IndexType.value, unique: true)
  late String userId;
  late int savedAt;
}

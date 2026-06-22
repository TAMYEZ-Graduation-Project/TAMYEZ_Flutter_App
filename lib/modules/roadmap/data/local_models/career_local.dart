import 'package:isar_community/isar.dart';

part 'career_local.g.dart';

@collection
class CareerLocal {
  Id id = Isar.autoIncrement;
  @Index(type: IndexType.value, unique: true)
  late String careerId;
  @Index(type: IndexType.value, unique: true)
  late String title;
  late String slug;
  late String pictureUrl;
  late String description;
  late bool isActive;
  late int stepsCount;
  late int percentageCompleted;
  late String createdAt;
  late String updatedAt;
  late int v;
  late int savedAt;
}

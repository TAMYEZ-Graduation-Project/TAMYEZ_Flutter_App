import 'package:isar_community/isar.dart';

part 'career_local.g.dart';

@collection
class CareerLocal {
  Id id = Isar.autoIncrement;

  late String careerId;

  late String title;
  @Index(type: IndexType.value, unique: true)
  late String userId;
  late String slug;
  late String pictureUrl;
  late String description;
  late bool isActive;
  late int stepsCount;
  late int percentageCompleted;
  late String createdAt;
  late String updatedAt;
  late int orderEpoch;
  late int v;
  late int savedAt;
  late int lastPage;
  late int size;
}

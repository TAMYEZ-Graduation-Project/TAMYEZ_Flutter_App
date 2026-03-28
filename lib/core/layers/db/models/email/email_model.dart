import 'package:isar_community/isar.dart';

part 'email_model.g.dart';

@collection
class Email {
  Id id = Isar.autoIncrement;
  @Index(type: IndexType.value, unique: true)
  String? title;

  List<Recipient>? recipients;

  @enumerated
  Status status = Status.pending;
}

@embedded
class Recipient {
  String? name;

  String? address;
}

enum Status { draft, pending, sent }

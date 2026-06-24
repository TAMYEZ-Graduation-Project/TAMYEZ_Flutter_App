import 'package:isar_community/isar.dart';

part 'pagination_data_local.g.dart';

@Embedded()
class PaginationDataLocal {
  late int totalCount;
  late int totalPages;
  late int currentPage;
  late int size;
}

import 'package:equatable/equatable.dart';

class PaginationDataEntity extends Equatable {
  final num totalCount;
  final num totalPages;
  final num currentPage;
  final num size;

  const PaginationDataEntity({
    this.totalCount = 0,
    this.totalPages = 0,
    this.currentPage = 0,
    this.size = 0,
  });

  @override
  List<Object?> get props => [totalCount, totalPages, currentPage, size];
}

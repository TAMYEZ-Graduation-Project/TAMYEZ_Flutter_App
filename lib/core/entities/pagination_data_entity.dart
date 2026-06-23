import 'package:equatable/equatable.dart';

class PaginationDataEntity extends Equatable {
  final int totalCount;
  final int totalPages;
  final int currentPage;
  final int size;

  const PaginationDataEntity({
    this.totalCount = 0,
    this.totalPages = 0,
    this.currentPage = 0,
    this.size = 0,
  });

  @override
  List<Object?> get props => [totalCount, totalPages, currentPage, size];
}

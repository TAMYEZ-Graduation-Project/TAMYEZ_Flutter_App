import 'package:equatable/equatable.dart';

import '../../../../../../core/entities/pagination_data_entity.dart';
import '../../../../../../core/presentation/result/ui_result.dart';
import '../../../../domain/entities/saved_quizzes_entity.dart';

class SavedQuizzesState with EquatableMixin {
  final UiResult<List<SavedQuizEntity>> getSavedQuizzesResult;
  final PaginationDataEntity paginationData;
  final bool isLoadingMore;

  const SavedQuizzesState({
    this.getSavedQuizzesResult = const Initial(),
    this.paginationData = const PaginationDataEntity(),
    this.isLoadingMore = false,
  });

  @override
  List<Object?> get props => [getSavedQuizzesResult, isLoadingMore];

  SavedQuizzesState copyWith({
    UiResult<List<SavedQuizEntity>>? getSavedQuizzesResult,
    PaginationDataEntity? paginationData,
    bool? isLoadingMore,
  }) {
    return SavedQuizzesState(
      getSavedQuizzesResult:
          getSavedQuizzesResult ?? this.getSavedQuizzesResult,
      paginationData: paginationData ?? this.paginationData,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

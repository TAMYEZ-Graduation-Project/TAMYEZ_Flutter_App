import 'package:equatable/equatable.dart';

import '../../../../../../core/entities/career_entity.dart';
import '../../../../../../core/entities/pagination_data_entity.dart';
import '../../../../../../core/presentation/result/ui_result.dart';

class RoadmapState with EquatableMixin {
  final UiResult<CareerEntity> careerDetails;
  final bool gettingMoreSteps;
  final PaginationDataEntity stepsPaginationData;

  const RoadmapState({
    this.careerDetails = const Initial(),
    this.gettingMoreSteps = false,
    this.stepsPaginationData = const PaginationDataEntity(),
  });

  @override
  List<Object?> get props => [
    careerDetails,
    gettingMoreSteps,
    stepsPaginationData,
  ];

  RoadmapState copyWith({
    UiResult<CareerEntity>? careerDetails,
    bool? gettingMoreSteps,
    PaginationDataEntity? stepsPaginationData,
  }) {
    return RoadmapState(
      careerDetails: careerDetails ?? this.careerDetails,
      gettingMoreSteps: gettingMoreSteps ?? this.gettingMoreSteps,
      stepsPaginationData: stepsPaginationData ?? this.stepsPaginationData,
    );
  }

  bool get isLastPage =>
      stepsPaginationData.currentPage >= stepsPaginationData.totalPages;
}

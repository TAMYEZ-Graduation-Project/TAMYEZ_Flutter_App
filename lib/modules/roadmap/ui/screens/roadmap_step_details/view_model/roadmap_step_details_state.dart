import 'package:equatable/equatable.dart';

import '../../../../../../core/entities/roadmap_step_entity.dart';
import '../../../../../../core/presentation/result/ui_result.dart';

class RoadmapStepDetailsState with EquatableMixin {
  final UiResult<RoadmapStepEntity> roadmapStepDetailsResult;

  const RoadmapStepDetailsState({
    this.roadmapStepDetailsResult = const Loading(),
  });

  @override
  List<Object?> get props => [roadmapStepDetailsResult];

  RoadmapStepDetailsState copyWith({
    UiResult<RoadmapStepEntity>? roadmapStepDetailsResult,
  }) {
    return RoadmapStepDetailsState(
      roadmapStepDetailsResult:
          roadmapStepDetailsResult ?? this.roadmapStepDetailsResult,
    );
  }
}

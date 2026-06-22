import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/entities/roadmap_step_entity.dart';
import '../../../../../../core/execution/operation_result.dart';
import '../../../../../../core/presentation/result/ui_result.dart';
import '../../../../domain/use_cases/get_roadmap_step_details_use_case.dart';
import 'roadmap_step_details_intent.dart';
import 'roadmap_step_details_state.dart';

@injectable
class RoadmapStepDetailsViewModel extends Cubit<RoadmapStepDetailsState> {
  final GetRoadmapStepDetailsUseCase _getRoadmapStepDetailsUseCase;

  RoadmapStepDetailsViewModel(this._getRoadmapStepDetailsUseCase)
    : super(const RoadmapStepDetailsState());

  Future<void> doIntent(RoadmapStepDetailsIntent intent) async {
    switch (intent) {
      case GetRoadmapStepDetailsIntent():
        await _getRoadmapStepDetails(intent.roadmapStepId);
    }
  }

  Future<void> _getRoadmapStepDetails(String roadmapStepId) async {
    emit(state.copyWith(roadmapStepDetailsResult: const Loading()));
    final result = await _getRoadmapStepDetailsUseCase.call(
      roadmapStepId: roadmapStepId,
    );

    switch (result) {
      case OperationSuccess<RoadmapStepEntity>():
        emit(state.copyWith(roadmapStepDetailsResult: Success(result.data)));
      case OperationFailure<RoadmapStepEntity>():
        emit(state.copyWith(roadmapStepDetailsResult: Error(result.failure)));
    }
  }
}

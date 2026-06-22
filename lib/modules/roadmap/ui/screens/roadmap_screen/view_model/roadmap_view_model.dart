import 'package:injectable/injectable.dart';

import '../../../../../../core/auth_providers/user_provider.dart';
import '../../../../../../core/entities/career_entity.dart';
import '../../../../../../core/entities/pagination_data_entity.dart';
import '../../../../../../core/execution/operation_result.dart';
import '../../../../../../core/presentation/bases/base_cubit.dart';
import '../../../../../../core/presentation/result/ui_effect.dart';
import '../../../../../../core/presentation/result/ui_result.dart';
import '../../../../domain/entities/roadmap_steps_response_entity.dart';
import '../../../../domain/use_cases/get_career_details_use_case.dart';
import '../../../../domain/use_cases/get_roadmap_steps_use_case.dart';
import 'roadmap_intent.dart';
import 'roadmap_state.dart';

@injectable
class RoadmapViewModel extends BaseCubit<RoadmapState, UiEffect> {
  final GetUserCareerUseCase _getUserCareerUseCase;
  final GetRoadmapStepsUseCase _getRoadmapStepsUseCase;
  final UserProvider _userProvider;

  RoadmapViewModel(
    this._getUserCareerUseCase,
    this._getRoadmapStepsUseCase,
    this._userProvider,
  ) : super(const RoadmapState());

  Future<void> doIntent(RoadmapIntent intent) async {
    switch (intent) {
      case GetUserCareerIntent():
        await _getUserCareer();
      case GetRoadmapStepsIntent():
        await _getRoadmapSteps();
    }
  }

  Future<void> _getUserCareer() async {
    emit(state.copyWith(careerDetails: const Loading()));
    final result = await _getUserCareerUseCase(
      careerId: _userProvider.user!.careerPath!.id,
    );

    switch (result) {
      case OperationSuccess<CareerEntity>():
        if (result.warning != null) {
          emitEffect(DisplayWarningEffect(failure: result.warning!));
        }
        emit(
          state.copyWith(
            careerDetails: Success(result.data),
            stepsPaginationData: PaginationDataEntity(
              currentPage: 1,
              size: 10,
              totalPages: (result.data.stepsCount / 10).ceil(),
              totalCount: result.data.stepsCount,
            ),
          ),
        );
      case OperationFailure<CareerEntity>():
        emit(state.copyWith(careerDetails: Error(result.failure)));
    }
  }

  Future<void> _getRoadmapSteps() async {
    if (state.gettingMoreSteps ||
        state.stepsPaginationData.totalPages ==
            state.stepsPaginationData.currentPage) {
      return;
    }
    emit(state.copyWith(gettingMoreSteps: true));
    final result = await _getRoadmapStepsUseCase(
      page: state.stepsPaginationData.currentPage.toInt() + 1,
      careerId: _userProvider.user!.careerPath!.id,
    );

    switch (result) {
      case OperationSuccess<RoadmapStepsResponseBodyEntity>():
        final career = (state.careerDetails as Success<CareerEntity>).data;
        final newCareer = career.copyWith(
          roadmap: career.roadmap.map((e) => e.copyWith()).toList()
            ..addAll(result.data.data),
        );
        emit(
          state.copyWith(
            gettingMoreSteps: false,
            stepsPaginationData: result.data.paginationData,
            careerDetails: Success(newCareer),
          ),
        );
      case OperationFailure<RoadmapStepsResponseBodyEntity>():
        emit(state.copyWith(gettingMoreSteps: false));
        emitEffect(DisplayErrorEffect(failure: result.failure));
    }
  }
}

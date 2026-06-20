import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:injectable/injectable.dart' show injectable;

import '../../../../../../core/entities/career_entity.dart';
import '../../../../../../core/execution/operation_result.dart';
import '../../../../../../core/presentation/result/ui_result.dart';
import '../../../../domain/use_cases/get_career_details_use_case.dart';
import 'career_details_intent.dart'
    show CareerDetailsIntent, GetCareerDetailsIntent;
import 'career_details_state.dart';

@injectable
class CareerDetailsViewModel extends Cubit<CareerDetailsState> {
  final GetCareerDetailsUseCase _careerDetailsUseCase;

  CareerDetailsViewModel(this._careerDetailsUseCase)
    : super(const CareerDetailsState());

  Future<void> doIntent(CareerDetailsIntent intent) async {
    switch (intent) {
      case GetCareerDetailsIntent():
        await _getCareerDetails(intent.careerId);
    }
  }

  Future<void> _getCareerDetails(String careerId) async {
    emit(state.copyWith(careerDetailsResult: const Loading()));
    final result = await _careerDetailsUseCase(careerId: careerId);

    switch (result) {
      case OperationSuccess<CareerEntity>():
        emit(state.copyWith(careerDetailsResult: Success(result.data)));
      case OperationFailure<CareerEntity>():
        emit(state.copyWith(careerDetailsResult: Error(result.failure)));
    }
  }
}

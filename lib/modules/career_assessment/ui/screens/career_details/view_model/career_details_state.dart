import 'package:equatable/equatable.dart';

import '../../../../../../core/entities/career_entity.dart';
import '../../../../../../core/presentation/result/ui_result.dart';

class CareerDetailsState with EquatableMixin {
  final UiResult<CareerEntity> careerDetailsResult;

  const CareerDetailsState({this.careerDetailsResult = const Initial()});

  @override
  List<Object?> get props => [careerDetailsResult];

  CareerDetailsState copyWith({UiResult<CareerEntity>? careerDetailsResult}) {
    return CareerDetailsState(
      careerDetailsResult: careerDetailsResult ?? this.careerDetailsResult,
    );
  }
}

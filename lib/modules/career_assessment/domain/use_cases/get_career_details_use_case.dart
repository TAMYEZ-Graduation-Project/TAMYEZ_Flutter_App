import 'package:injectable/injectable.dart';

import '../../../../core/entities/career_entity.dart';
import '../../../../core/execution/operation_result.dart' show OperationResult;
import '../repositories/career_assessment_repo.dart' show CareerAssessmentRepo;

@injectable
class GetCareerDetailsUseCase {
  final CareerAssessmentRepo _repo;

  const GetCareerDetailsUseCase(this._repo);

  Future<OperationResult<CareerEntity>> call({required String careerId}) {
    return _repo.getCareerDetails(careerId: careerId);
  }
}

import 'package:injectable/injectable.dart';

import '../../../../core/entities/user_entity.dart';
import '../../../../core/execution/operation_result.dart' show OperationResult;
import '../repositories/career_assessment_repo.dart' show CareerAssessmentRepo;

@injectable
class ChooseSuggestedCareerUseCase {
  final CareerAssessmentRepo _repo;

  const ChooseSuggestedCareerUseCase(this._repo);

  Future<OperationResult<UserEntity>> call({
    required String suggestedCareerId,
  }) {
    return _repo.chooseSuggestedCareer(suggestedCareerId: suggestedCareerId);
  }
}

import 'package:injectable/injectable.dart';

import '../../../../core/entities/career_entity.dart';
import '../../../../core/execution/operation_result.dart';
import '../repositories/roadmap_repository.dart';

@injectable
class GetUserCareerUseCase {
  final RoadmapRepository _repository;

  const GetUserCareerUseCase(this._repository);

  Future<OperationResult<CareerEntity>> call({required String userId}) {
    return _repository.getUserCareer(userId: userId);
  }
}

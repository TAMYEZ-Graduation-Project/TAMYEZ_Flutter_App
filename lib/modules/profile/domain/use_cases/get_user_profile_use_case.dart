import 'package:injectable/injectable.dart';

import '../../../../core/entities/user_entity.dart';
import '../../../../core/execution/operation_result.dart';
import '../repositories/profile_repository.dart';

@injectable
class GetUserProfileUseCase {
  final ProfileRepository _repository;

  const GetUserProfileUseCase(this._repository);

  Future<OperationResult<UserEntity>> call() {
    return _repository.syncUserProfile();
  }
}

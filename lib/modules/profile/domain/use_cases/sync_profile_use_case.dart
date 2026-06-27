import 'package:injectable/injectable.dart';

import '../../../../core/entities/user_entity.dart';
import '../../../../core/execution/operation_result.dart';
import '../repositories/profile_repository.dart';

@injectable
class SyncProfileUseCase {
  final ProfileRepository _repository;

  const SyncProfileUseCase(this._repository);

  Future<OperationResult<UserEntity>> call() {
    return _repository.syncUserProfile();
  }
}

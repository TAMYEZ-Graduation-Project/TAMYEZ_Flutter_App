import 'package:injectable/injectable.dart';

import '../../../../core/execution/operation_result.dart';
import '../repositories/profile_repository.dart';

@injectable
class DisableNotificationsUseCase {
  final ProfileRepository _repository;

  const DisableNotificationsUseCase(this._repository);

  Future<OperationResult<void>> call() {
    return _repository.disableNotifications();
  }
}

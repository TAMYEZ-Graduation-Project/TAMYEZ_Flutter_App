import 'package:injectable/injectable.dart';

import '../../../../core/execution/operation_result.dart';
import '../repositories/profile_repository.dart';

@injectable
class LogoutUseCase {
  final ProfileRepository _repository;

  const LogoutUseCase(this._repository);

  Future<OperationResult<void>> call({required bool notificationsEnabled}) {
    return _repository.logout(notificationsEnabled: notificationsEnabled);
  }
}

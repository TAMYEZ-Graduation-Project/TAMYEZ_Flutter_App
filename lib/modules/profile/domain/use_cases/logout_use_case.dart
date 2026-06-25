import 'package:injectable/injectable.dart';

import '../../../../core/execution/operation_result.dart';
import '../repositories/profile_repository.dart';

@injectable
class LogoutUseCase {
  final ProfileRepository _repository;

  const LogoutUseCase(this._repository);

  Future<OperationResult<void>> call({String? deviceId}) {
    return _repository.logout(deviceId: deviceId);
  }
}

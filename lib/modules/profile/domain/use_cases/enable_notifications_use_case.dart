import 'package:injectable/injectable.dart';

import '../../../../core/execution/operation_result.dart';
import '../repositories/profile_repository.dart';

@injectable
class EnableNotificationsUseCase {
  final ProfileRepository _repository;

  const EnableNotificationsUseCase(this._repository);

  Future<OperationResult<void>> call({String? replaceDeviceId}) {
    return _repository.enableNotifications(replaceDeviceId: replaceDeviceId);
  }
}

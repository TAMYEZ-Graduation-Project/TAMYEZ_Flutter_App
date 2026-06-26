import 'package:injectable/injectable.dart';

import '../../../../core/execution/operation_result.dart';
import '../repositories/profile_repository.dart';

@injectable
class RefreshFcmTokenUseCase {
  final ProfileRepository _repository;

  const RefreshFcmTokenUseCase(this._repository);

  Future<OperationResult<void>> call({required String fcmToken}) {
    return _repository.refreshFcmToken(fcmToken: fcmToken);
  }
}

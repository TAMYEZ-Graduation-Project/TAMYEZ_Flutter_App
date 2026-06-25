import 'package:injectable/injectable.dart';

import '../../../../core/execution/operation_result.dart';
import '../entities/change_password_params.dart';
import '../repositories/profile_repository.dart';

@injectable
class ChangePasswordUseCase {
  final ProfileRepository _repository;

  const ChangePasswordUseCase(this._repository);

  Future<OperationResult<void>> call({
    required ChangePasswordParams params,
    required bool userRemembered,
  }) async {
    return _repository.changePassword(
      params: params,
      userRemembered: userRemembered,
    );
  }
}

import 'package:injectable/injectable.dart';

import '../../../../core/execution/operation_result.dart';
import '../entities/reset_password_params.dart';
import '../repositories/auth_repository.dart';

@injectable
class ResetPasswordUseCase {
  final AuthRepository _authRepository;

  const ResetPasswordUseCase(this._authRepository);

  Future<OperationResult<bool>> call({required ResetPasswordParams params}) {
    return _authRepository.resetPassword(params: params);
  }
}

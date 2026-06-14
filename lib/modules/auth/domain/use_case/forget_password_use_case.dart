import 'package:injectable/injectable.dart';

import '../../../../core/execution/operation_result.dart';
import '../entities/user_email_params.dart';
import '../repositories/auth_repository.dart';

@injectable
class ForgetPasswordUseCase {
  final AuthRepository _authRepository;

  const ForgetPasswordUseCase(this._authRepository);

  Future<OperationResult<bool>> call({required UserEmailParams params}) {
    return _authRepository.forgetPassword(params: params);
  }
}

import 'package:injectable/injectable.dart';

import '../../../../core/execution/operation_result.dart';
import '../entities/verify_code_params.dart';
import '../repositories/auth_repository.dart';

@injectable
class VerifyCodeUseCase {
  final AuthRepository _authRepository;

  const VerifyCodeUseCase(this._authRepository);

  Future<OperationResult<bool>> call({required VerifyCodeParams params}) {
    return _authRepository.verifyCode(params: params);
  }
}

import 'package:injectable/injectable.dart';

import '../../../../core/execution/operation_result.dart';
import '../entities/login_params.dart';
import '../entities/login_response_entity.dart';
import '../repositories/auth_repository.dart';

@injectable
class LoginUseCase {
  final AuthRepository _authRepository;

  const LoginUseCase(this._authRepository);

  Future<OperationResult<LoginResponseEntity>> call({
    required LoginParams params,
  }) {
    return _authRepository.login(params: params);
  }
}

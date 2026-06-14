import 'package:injectable/injectable.dart';

import '../../../../core/execution/operation_result.dart';
import '../entities/sign_up_params.dart';
import '../entities/sign_up_response_entity.dart';
import '../repositories/auth_repository.dart';

@injectable
class SignUpUseCase {
  final AuthRepository _authRepository;

  const SignUpUseCase(this._authRepository);

  Future<OperationResult<SignUpResponseEntity>> call({
    required SignUpParams params,
  }) {
    return _authRepository.signUp(params: params);
  }
}

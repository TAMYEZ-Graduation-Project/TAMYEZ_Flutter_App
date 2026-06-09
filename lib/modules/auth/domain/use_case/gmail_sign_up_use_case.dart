import 'package:injectable/injectable.dart';

import '../../../../core/execution/operation_result.dart';
import '../entities/login_response_entity.dart';
import '../repositories/auth_repository.dart';

@injectable
class GmailSignUpUseCase {
  final AuthRepository _authRepository;

  const GmailSignUpUseCase(this._authRepository);

  Future<OperationResult<LoginResponseEntity>> call() {
    return _authRepository.gmailSignUp();
  }
}

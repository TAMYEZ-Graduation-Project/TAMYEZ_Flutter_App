import 'package:injectable/injectable.dart';

import '../../../../core/execution/operation_result.dart';
import '../entities/login_response_entity.dart';
import '../repositories/auth_repository.dart';

@injectable
class GmailLoginUseCase {
  final AuthRepository _authRepository;

  const GmailLoginUseCase(this._authRepository);

  Future<OperationResult<LoginResponseEntity>> call({
    required bool rememberMe,
  }) {
    return _authRepository.gmailLogin(rememberMe: rememberMe);
  }
}

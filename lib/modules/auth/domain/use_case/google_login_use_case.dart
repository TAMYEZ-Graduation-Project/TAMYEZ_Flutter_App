import 'package:injectable/injectable.dart';

import '../../../../core/execution/operation_result.dart';
import '../repositories/auth_repository.dart';

@injectable
class GoogleLoginUseCase {
  final AuthRepository _authRepository;

  const GoogleLoginUseCase(this._authRepository);

  Future<OperationResult<void>> call() {
    return _authRepository.googleSocialLogin();
  }
}

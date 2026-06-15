import 'package:injectable/injectable.dart';

import '../../../../core/entities/login_session_entity.dart';
import '../repositories/auth_repository.dart';

@injectable
class GetLoginSessionUseCase {
  final AuthRepository _authRepository;

  const GetLoginSessionUseCase(this._authRepository);

  Future<LoginSessionEntity?> call() {
    return _authRepository.getLoginSession();
  }
}

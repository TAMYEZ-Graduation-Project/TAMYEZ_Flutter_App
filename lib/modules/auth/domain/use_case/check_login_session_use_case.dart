import 'package:injectable/injectable.dart';

import '../repositories/auth_repository.dart';

@injectable
class CheckLoginSessionUseCase {
  final AuthRepository _authRepository;

  const CheckLoginSessionUseCase(this._authRepository);

  Future<bool> call() {
    return _authRepository.isThereLoginSession();
  }
}

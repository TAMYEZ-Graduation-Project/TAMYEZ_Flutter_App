import 'package:injectable/injectable.dart';

import '../../../../core/execution/operation_result.dart';
import '../repositories/profile_repository.dart';

@injectable
class DeleteAccountUseCase {
  final ProfileRepository _repository;

  const DeleteAccountUseCase(this._repository);

  Future<OperationResult<void>> call({required int version}) {
    return _repository.deleteAccount(version: version);
  }
}

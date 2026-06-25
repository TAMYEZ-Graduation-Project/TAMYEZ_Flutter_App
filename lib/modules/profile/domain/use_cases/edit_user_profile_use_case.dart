import 'package:injectable/injectable.dart';

import '../../../../core/execution/operation_result.dart';
import '../entities/edit_profile_params.dart';
import '../repositories/profile_repository.dart';

@injectable
class EditUserProfileUseCase {
  final ProfileRepository _repository;

  const EditUserProfileUseCase(this._repository);

  Future<OperationResult<void>> call({
    required EditUserProfileParams params,
    bool saveLocally = true,
  }) {
    return _repository.editUserProfile(
      params: params,
      saveLocally: saveLocally,
    );
  }
}

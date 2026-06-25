import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../core/execution/operation_result.dart';
import '../entities/upload_profile_picture_response_entity.dart';
import '../repositories/profile_repository.dart';

@injectable
class UploadProfilePictureUseCase {
  final ProfileRepository _repository;

  const UploadProfilePictureUseCase(this._repository);

  Future<OperationResult<UploadProfilePictureBodyEntity>> call({
    required File image,
    required int version,
    bool saveLocally = true,
  }) {
    return _repository.uploadProfilePicture(
      image: image,
      version: version,
      saveLocally: saveLocally,
    );
  }
}

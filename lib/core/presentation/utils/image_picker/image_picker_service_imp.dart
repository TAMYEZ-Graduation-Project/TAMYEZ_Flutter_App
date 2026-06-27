import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../error/failures/app_failures.dart';
import '../../../execution/operation_result.dart';
import '../../../utils/functions/safe_print.dart';
import 'image_picker_service.dart';

@Injectable(as: ImagePickerService)
class ImagePickerServiceImpl implements ImagePickerService {
  final ImagePicker _picker;

  const ImagePickerServiceImpl(this._picker);

  @override
  Future<OperationResult<File?>> pickFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      return OperationSuccess(image == null ? null : File(image.path));
    } catch (e) {
      safePrint(e.toString());
      return OperationFailure(const ImagePickerFailure());
    }
  }
}

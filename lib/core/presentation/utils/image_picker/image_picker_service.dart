import 'dart:io';

import '../../../execution/operation_result.dart';

abstract interface class ImagePickerService {
  Future<OperationResult<File?>> pickFromGallery();
}

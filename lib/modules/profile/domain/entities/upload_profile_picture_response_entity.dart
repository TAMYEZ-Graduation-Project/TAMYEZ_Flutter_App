import 'package:equatable/equatable.dart';

class UploadProfilePictureResponseEntity extends Equatable {
  const UploadProfilePictureResponseEntity({
    this.success = true,
    this.message = '',
    this.body = const UploadProfilePictureBodyEntity(),
  });

  final bool success;
  final String message;
  final UploadProfilePictureBodyEntity body;

  @override
  List<Object?> get props => [success, message, body];
}

class UploadProfilePictureBodyEntity extends Equatable {
  const UploadProfilePictureBodyEntity({this.url = '', this.v = 0});

  final String url;
  final num v;

  @override
  List<Object?> get props => [url, v];
}

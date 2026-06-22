import '../../../../core/network/models/career_dto.dart';

class CareerDetailsResponse {
  bool? success;
  String? message;
  CareerDto? body;

  CareerDetailsResponse({this.success, this.message, this.body});

  CareerDetailsResponse.fromJson(dynamic json) {
    success = json['success'] as bool?;
    message = json['message'] as String?;
    body = json['body'] != null ? CareerDto.fromJson(json['body']) : null;
  }
}

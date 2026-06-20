import '../../../../core/network/models/career_dto.dart';

class CareerDetailsResponse {
  CareerDetailsResponse({this.success, this.message, this.body});

  CareerDetailsResponse.fromJson(dynamic json) {
    success = json['success'] as bool?;
    message = json['message'] as String?;
    body = json['body'] != null ? CareerDto.fromJson(json['body']) : null;
  }

  bool? success;
  String? message;
  CareerDto? body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (body != null) {
      map['body'] = body?.toJson();
    }
    return map;
  }
}

import '../../../../core/network/models/roadmap_step_dto.dart';

class RoadmapStepDetailsResponse {
  bool? success;
  String? message;
  RoadmapStepDto? body;

  RoadmapStepDetailsResponse({this.success, this.message, this.body});

  RoadmapStepDetailsResponse.fromJson(dynamic json) {
    success = json['success'] as bool?;
    message = json['message'] as String?;
    body = json['body'] != null
        ? RoadmapStepDto.fromJson(json['body'] as Map<String, dynamic>)
        : null;
  }
}

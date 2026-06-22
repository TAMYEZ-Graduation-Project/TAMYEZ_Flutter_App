import '../../../../core/network/models/roadmap_step_dto.dart';

class RoadmapStepsResponse {
  bool? success;
  String? message;
  RoadmapStepsResponseBody? body;

  RoadmapStepsResponse({this.success, this.message, this.body});

  RoadmapStepsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'] as bool;
    message = json['message'] as String;
    body = json['body'] != null
        ? RoadmapStepsResponseBody.fromJson(
            json['body'] as Map<String, dynamic>,
          )
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['message'] = message;
    if (body != null) {
      data['body'] = body!.toJson();
    }
    return data;
  }
}

class RoadmapStepsResponseBody {
  num? totalCount;
  num? totalPages;
  num? currentPage;
  num? size;
  num? percentageCompleted;
  List<RoadmapStepDto>? data;

  RoadmapStepsResponseBody({
    this.totalCount,
    this.totalPages,
    this.currentPage,
    this.size,
    this.percentageCompleted,
    this.data,
  });

  RoadmapStepsResponseBody.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'] as num?;
    totalPages = json['totalPages'] as num?;
    currentPage = json['currentPage'] as num?;
    size = json['size'] as num?;
    percentageCompleted = json['percentageCompleted'] as num?;
    if (json['data'] != null) {
      data = (json['data'] as List)
          .map((v) {
            return RoadmapStepDto.fromJson(v as Map<String, dynamic>);
          })
          .whereType<RoadmapStepDto>()
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['totalCount'] = totalCount;
    data['totalPages'] = totalPages;
    data['currentPage'] = currentPage;
    data['size'] = size;
    data['percentageCompleted'] = percentageCompleted;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

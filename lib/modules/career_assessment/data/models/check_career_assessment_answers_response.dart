class CheckCareerAssessmentAnswersResponse {
  CheckCareerAssessmentAnswersResponse({this.success, this.message, this.body});

  CheckCareerAssessmentAnswersResponse.fromJson(dynamic json) {
    success = json['success'] as bool?;
    message = json['message'] as String?;
    if (json['body'] != null) {
      body = (json['body'] as List).map(SuggestedCareerDto.fromJson).toList();
    }
  }

  bool? success;
  String? message;
  List<SuggestedCareerDto>? body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (body != null) {
      map['body'] = body?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class SuggestedCareerDto {
  SuggestedCareerDto({this.careerId, this.title, this.reason, this.confidence});

  SuggestedCareerDto.fromJson(dynamic json) {
    careerId = json['careerId'] != null
        ? CareerIdDto.fromJson(json['careerId'] as Map<String, dynamic>)
        : null;
    title = json['title'] as String?;
    reason = json['reason'] as String?;
    confidence = json['confidence'] as num?;
  }

  CareerIdDto? careerId;
  String? title;
  String? reason;
  num? confidence;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['careerId'] = careerId?.toJson();
    map['title'] = title;
    map['reason'] = reason;
    map['confidence'] = confidence;
    return map;
  }
}

class CareerIdDto {
  final String? id;
  final String? pictureUrl;

  const CareerIdDto({this.id, this.pictureUrl});

  factory CareerIdDto.fromJson(Map<String, dynamic> json) {
    return CareerIdDto(
      id: json['id'] as String?,
      pictureUrl: json['pictureUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'pictureUrl': pictureUrl};
  }
}

class CheckCareerAssessmentAnswersResponse {
  CheckCareerAssessmentAnswersResponse({this.success, this.message, this.body});

  CheckCareerAssessmentAnswersResponse.fromJson(dynamic json) {
    success = json['success'] as bool?;
    message = json['message'] as String?;
    body = json['body'] != null
        ? CheckCareerAssessmentAnswersResponseBody.fromJson(json['body'])
        : null;
  }

  bool? success;
  String? message;
  CheckCareerAssessmentAnswersResponseBody? body;

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

class CheckCareerAssessmentAnswersResponseBody {
  CheckCareerAssessmentAnswersResponseBody({this.suggestedCareers});

  CheckCareerAssessmentAnswersResponseBody.fromJson(dynamic json) {
    if (json['suggestedCareers'] != null) {
      suggestedCareers = (json['suggestedCareers'] as List)
          .map((e) => SuggestedCareerDto.fromJson(e as Map<String, dynamic>))
          .cast<SuggestedCareerDto>()
          .toList();
    }
  }

  List<SuggestedCareerDto>? suggestedCareers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (suggestedCareers != null) {
      map['suggestedCareers'] = suggestedCareers
          ?.map((v) => v.toJson())
          .toList();
    }
    return map;
  }
}

class SuggestedCareerDto {
  SuggestedCareerDto({this.careerId, this.title, this.reason, this.confidence});

  SuggestedCareerDto.fromJson(dynamic json) {
    careerId = json['careerId'] as String?;
    title = json['title'] as String?;
    reason = json['reason'] as String?;
    confidence = json['confidence'] as num?;
  }

  String? careerId;
  String? title;
  String? reason;
  num? confidence;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['careerId'] = careerId;
    map['title'] = title;
    map['reason'] = reason;
    map['confidence'] = confidence;
    return map;
  }
}

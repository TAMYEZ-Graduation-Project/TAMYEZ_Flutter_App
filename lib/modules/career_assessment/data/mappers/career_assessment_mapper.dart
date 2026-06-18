import '../../domain/entities/check_career_assessment_answers_response_entity.dart'
    show
        SuggestedCareerEntity,
        CheckCareerAssessmentAnswersResponseBodyEntity,
        CheckCareerAssessmentAnswersResponseEntity;
import '../models/check_career_assessment_answers_response.dart';

extension CheckCareerAssessmentAnswersResponseMapper
    on CheckCareerAssessmentAnswersResponse {
  CheckCareerAssessmentAnswersResponseEntity toEntity() {
    return CheckCareerAssessmentAnswersResponseEntity(
      success: success ?? false,
      message: message ?? '',
      body:
          body?.toEntity() ??
          const CheckCareerAssessmentAnswersResponseBodyEntity(),
    );
  }
}

extension CheckCareerAssessmentAnswersResponseBodyMapper
    on CheckCareerAssessmentAnswersResponseBody {
  CheckCareerAssessmentAnswersResponseBodyEntity toEntity() {
    return CheckCareerAssessmentAnswersResponseBodyEntity(
      suggestedCareers:
          suggestedCareers?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension SuggestedCareerDtoMapper on SuggestedCareerDto {
  SuggestedCareerEntity toEntity() {
    return SuggestedCareerEntity(
      careerId: careerId ?? '',
      title: title ?? '',
      reason: reason ?? '',
      confidence: confidence ?? 0,
    );
  }
}

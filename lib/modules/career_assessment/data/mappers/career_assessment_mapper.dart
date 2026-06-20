import '../../../../core/entities/career_entity.dart';
import '../../../../core/entities/user_entity.dart';
import '../../../../core/mappers/base_auth_mapper.dart';
import '../../../../core/mappers/base_career_mapper.dart';
import '../../domain/entities/career_details_entity.dart';
import '../../domain/entities/check_career_assessment_answers_response_entity.dart';
import '../../domain/entities/choose_suggested_career_response_entity.dart';
import '../models/career_details_response.dart';
import '../models/check_career_assessment_answers_response.dart';
import '../models/choose_suggested_career_response.dart';

extension CheckCareerAssessmentAnswersResponseMapper
    on CheckCareerAssessmentAnswersResponse {
  CheckCareerAssessmentAnswersResponseEntity toEntity() {
    return CheckCareerAssessmentAnswersResponseEntity(
      success: success ?? false,
      message: message ?? '',
      body: body?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension SuggestedCareerDtoMapper on SuggestedCareerDto {
  SuggestedCareerEntity toEntity() {
    return SuggestedCareerEntity(
      careerId: careerId?.toEntity() ?? const CareerIdEntity(),
      title: title ?? '',
      reason: reason ?? '',
      confidence: confidence ?? 0,
    );
  }
}

extension CareerIdDtoMapper on CareerIdDto {
  CareerIdEntity toEntity() {
    return CareerIdEntity(id: id ?? '', pictureUrl: pictureUrl ?? '');
  }
}

extension CareerDetailsResponseMapper on CareerDetailsResponse {
  CareerDetailsResponseEntity toEntity() {
    return CareerDetailsResponseEntity(
      success: success ?? false,
      message: message ?? '',
      body: body?.toEntity() ?? const CareerEntity(),
    );
  }
}

extension ChooseSuggestedCareerResponseMapper on ChooseSuggestedCareerResponse {
  ChooseSuggestedCareerResponseEntity toEntity() {
    return ChooseSuggestedCareerResponseEntity(
      success: success ?? false,
      message: message ?? '',
      body: body?.toEntity() ?? const ChooseSuggestedCareerBodyEntity(),
    );
  }
}

extension ChooseSuggestedCareerBodyDtoMapper on ChooseSuggestedCareerBody {
  ChooseSuggestedCareerBodyEntity toEntity() {
    return ChooseSuggestedCareerBodyEntity(
      user: user?.toEntity() ?? const UserEntity(),
    );
  }
}

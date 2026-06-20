import '../../constants/app_enums.dart' show CareerAssessmentStatusEnum;
import '../../entities/user_entity.dart';

bool userCompletedAssessment(UserEntity user) {
  return user.assessmentStatus ==
          CareerAssessmentStatusEnum.completed.strValue ||
      user.assessmentStatus == CareerAssessmentStatusEnum.canRetake.strValue;
}

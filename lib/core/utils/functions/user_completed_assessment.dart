import '../../constants/app_enums.dart' show CareerAssessmentStatusEnum;
import '../../entities/user_entity.dart';

bool userCompletedAssessment(UserEntity user) {
  return user.assessmentStatus == CareerAssessmentStatusEnum.completed ||
      user.assessmentStatus == CareerAssessmentStatusEnum.canRetake;
}

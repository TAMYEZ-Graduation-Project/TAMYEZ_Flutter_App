import '../constants/app_enums.dart';

extension CareerAssessmentStatusEnumValue on String {
  CareerAssessmentStatusEnum get careerAssessmentStatusEnum {
    switch (this) {
      case 'NotStarted':
        return CareerAssessmentStatusEnum.notStarted;
      case 'InProgress':
        return CareerAssessmentStatusEnum.inProgress;
      case 'Completed':
        return CareerAssessmentStatusEnum.completed;
      case 'CanRetake':
        return CareerAssessmentStatusEnum.canRetake;
      default:
        return CareerAssessmentStatusEnum.notStarted;
    }
  }
}

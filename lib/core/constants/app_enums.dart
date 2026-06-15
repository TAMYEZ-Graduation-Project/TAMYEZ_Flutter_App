enum CareerAssessmentStatusEnum {
  notStarted('NotStarted'),
  inProgress('InProgress'),
  completed('Completed'),
  canRetake('CanRetake');

  final String strValue;

  const CareerAssessmentStatusEnum(this.strValue);
}

enum UserRoleEnum {
  user('User'),
  admin('Admin'),
  superAdmin('SuperAdmin'),
  guest('Guest');

  final String strValue;

  const UserRoleEnum(this.strValue);
}

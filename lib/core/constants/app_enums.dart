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

enum TokenBearerKeysEnum {
  bearerUser('BUser'),
  bearerSystem('BSystem'),
  bearerSuperSystem('BSuperSystem');

  final String strValue;

  const TokenBearerKeysEnum(this.strValue);
}

enum QuestionOptionIdsEnum {
  empty('optEmpty'),
  optionA('optA'),
  optionB('optB'),
  optionC('optC'),
  optionD('optD');

  final String strValue;

  const QuestionOptionIdsEnum(this.strValue);
}

enum QuizQuestionTypesEnum {
  mcqSingle('mcq-single'),
  mcqMulti('mcq-multi'),
  written('written');

  final String strValue;

  const QuizQuestionTypesEnum(this.strValue);
}

enum RoadmapStepProgressStatusEnum {
  completed('Completed'),
  inProgress('InProgress'),
  available('Available'),
  lockedPrereq('LockedPrereq'),
  disabledFrozen('DisabledFrozen');

  final String strValue;

  const RoadmapStepProgressStatusEnum(this.strValue);
}

enum PlatformsEnum {
  flutterAndroid('flutter-android'),
  flutterIos('flutter-ios'),
  web('web');

  final String strValue;

  const PlatformsEnum(this.strValue);
}

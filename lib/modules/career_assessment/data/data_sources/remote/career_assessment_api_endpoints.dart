abstract class CareerAssessmentApiEndpoints {
  static const String getCareerAssessmentQuestions =
      'quiz/questions/CareerAssessment';

  static const String checkCareerAssessmentAnswers =
      'career/{${CareerAssessmentApiParams.quizAttemptId}}/check-assessment';

  static const String chooseSuggestedCareer =
      'career/{${CareerAssessmentApiParams.suggestedCareerId}}/choose-suggested-career';

  static const String getCareerDetails =
      'career/{${CareerAssessmentApiParams.careerId}}';
}

abstract class CareerAssessmentApiParams {
  static const String discardActiveAttempt = 'discardActiveAttempt';
  static const String quizAttemptId = 'quizAttemptId';
  static const String suggestedCareerId = 'suggestedCareerId';
  static const String careerId = 'careerId';
}

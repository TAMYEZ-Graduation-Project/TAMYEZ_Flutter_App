abstract class CareerAssessmentEndpoints {
  static const String getCareerAssessmentQuestions =
      'quiz/questions/CareerAssessment';

  static const String checkCareerAssessmentAnswers =
      'career/{${CareerAssessmentApiParams.quizAttemptId}}/check-assessment';

  static const String chooseSuggestedCareer =
      'career/{${CareerAssessmentApiParams.suggestedCareerId}}/choose-suggested-career';
}

abstract class CareerAssessmentApiParams {
  static const String discardActiveAttempt = 'discardActiveAttempt';
  static const String quizAttemptId = 'quizAttemptId';

  static const String suggestedCareerId = 'suggestedCareerId';
}

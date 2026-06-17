abstract class CareerAssessmentEndpoints {
  static const String getCareerAssessmentQuestions =
      'quiz/questions/CareerAssessment';

  static String checkCareerAssessmentAnswers(String quizAttemptId) {
    return 'career/$quizAttemptId/check-assessment';
  }

  static String chooseSuggestedCareer(String suggestedCareerId) {
    return 'career/$suggestedCareerId/choose-suggested-career';
  }
}

abstract class CareerAssessmentQueryParams {
  static const String discardActiveAttempt = 'discardActiveAttempt';
}

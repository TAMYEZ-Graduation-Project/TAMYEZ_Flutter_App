abstract class QuizApiEndpoints {
  static const String getQuizQuestions =
      'quiz/questions/{${QuizApiParams.quizId}}/{${QuizApiParams.roadmapStepId}}';

  static const String checkQuizAnswers =
      'quiz/{${QuizApiParams.quizAttemptId}}';
}

abstract class QuizApiParams {
  static const String discardActiveAttempt = 'discardActiveAttempt';
  static const String quizId = 'quizId';
  static const String roadmapStepId = 'roadmapStepId';
  static const String quizAttemptId = 'quizAttemptId';
}

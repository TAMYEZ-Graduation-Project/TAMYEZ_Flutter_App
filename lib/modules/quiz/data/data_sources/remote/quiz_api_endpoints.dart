abstract class QuizApiEndpoints {
  static const String getQuizQuestions =
      'quiz/questions/{${QuizApiParams.quizId}}/{${QuizApiParams.roadmapStepId}}';

  static const String checkQuizAnswers =
      'quiz/{${QuizApiParams.quizAttemptId}}';

  static const String getSavedQuizzes = 'quiz/saved';

  static const String getSavedQuiz =
      'quiz/saved/{${QuizApiParams.savedQuizId}}';
}

abstract class QuizApiParams {
  static const String discardActiveAttempt = 'discardActiveAttempt';
  static const String quizId = 'quizId';
  static const String roadmapStepId = 'roadmapStepId';
  static const String quizAttemptId = 'quizAttemptId';
  static const String page = 'page';
  static const String size = 'size';
  static const String savedQuizId = 'savedQuizId';
}

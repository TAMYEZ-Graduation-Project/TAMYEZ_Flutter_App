import 'package:equatable/equatable.dart';

import '../../../../../../core/entities/get_quiz_questions_entity.dart';
import '../../../../../../core/entities/question_answer_entity.dart';
import '../../../../../../core/presentation/result/ui_result.dart';
import '../../../../domain/entities/quiz_result_response_entity.dart';

class QuizState with EquatableMixin {
  final UiResult<QuizAttemptEntity> quizAttemptResult;
  final UiResult<QuizResultEntity> quizAnswersResult;
  final Map<String, QuestionAnswerEntity> questionAnswers;
  final Map<String, int> unAnsweredQuestions;
  final int currentQuestionIndex;
  final int remainingDuration;

  const QuizState({
    this.quizAttemptResult = const Initial(),
    this.quizAnswersResult = const Initial(),
    this.questionAnswers = const <String, QuestionAnswerEntity>{},
    this.unAnsweredQuestions = const <String, int>{},
    this.currentQuestionIndex = 0,
    this.remainingDuration = 0,
  });

  @override
  List<Object?> get props => [
    quizAttemptResult,
    quizAnswersResult,
    unAnsweredQuestions,
    questionAnswers,
    currentQuestionIndex,
    remainingDuration,
  ];

  QuizState copyWith({
    UiResult<QuizAttemptEntity>? quizAttemptResult,
    UiResult<QuizResultEntity>? quizAnswersResult,
    Map<String, QuestionAnswerEntity>? questionAnswers,
    Map<String, int>? unAnsweredQuestions,
    int? currentQuestionIndex,
    int? remainingDuration,
  }) {
    return QuizState(
      quizAttemptResult: quizAttemptResult ?? this.quizAttemptResult,
      quizAnswersResult: quizAnswersResult ?? this.quizAnswersResult,
      questionAnswers: questionAnswers ?? this.questionAnswers,
      unAnsweredQuestions: unAnsweredQuestions ?? this.unAnsweredQuestions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      remainingDuration: remainingDuration ?? this.remainingDuration,
    );
  }
}

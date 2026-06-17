import 'package:equatable/equatable.dart' show EquatableMixin;

import '../../../../../../core/entities/get_quiz_questions_entity.dart'
    show QuizAttemptEntity;
import '../../../../../../core/entities/question_answer_entity.dart';
import '../../../../../../core/presentation/result/ui_result.dart';

class CareerAssessmentState with EquatableMixin {
  final UiResult<QuizAttemptEntity> careerAssessmentResult;
  final Map<String, QuestionAnswerEntity> questionAnswers;
  final int currentQuestionIndex;

  const CareerAssessmentState({
    this.careerAssessmentResult = const Initial(),
    this.questionAnswers = const <String, QuestionAnswerEntity>{},
    this.currentQuestionIndex = 0,
  });

  @override
  List<Object?> get props => [
    careerAssessmentResult,
    questionAnswers,
    currentQuestionIndex,
  ];

  CareerAssessmentState copyWith({
    UiResult<QuizAttemptEntity>? careerAssessmentResult,
    Map<String, QuestionAnswerEntity>? questionAnswers,
    int? currentQuestionIndex,
  }) {
    return CareerAssessmentState(
      careerAssessmentResult:
          careerAssessmentResult ?? this.careerAssessmentResult,
      questionAnswers: questionAnswers ?? this.questionAnswers,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
    );
  }
}

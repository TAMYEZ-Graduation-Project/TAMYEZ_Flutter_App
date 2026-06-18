import 'package:equatable/equatable.dart' show EquatableMixin;

import '../../../../../../core/entities/get_quiz_questions_entity.dart'
    show QuizAttemptEntity;
import '../../../../../../core/entities/question_answer_entity.dart';
import '../../../../../../core/presentation/result/ui_result.dart';
import '../../../../domain/entities/check_career_assessment_answers_response_entity.dart'
    show SuggestedCareerEntity;

class CareerAssessmentState with EquatableMixin {
  final UiResult<QuizAttemptEntity> careerAssessmentResult;
  final UiResult<List<SuggestedCareerEntity>>
  checkCareerAssessmentAnswersResult;
  final Map<String, QuestionAnswerEntity> questionAnswers;
  final int currentQuestionIndex;

  const CareerAssessmentState({
    this.careerAssessmentResult = const Initial(),
    this.questionAnswers = const <String, QuestionAnswerEntity>{},
    this.checkCareerAssessmentAnswersResult = const Initial(),
    this.currentQuestionIndex = 0,
  });

  @override
  List<Object?> get props => [
    careerAssessmentResult,
    questionAnswers,
    currentQuestionIndex,
    checkCareerAssessmentAnswersResult,
  ];

  CareerAssessmentState copyWith({
    UiResult<QuizAttemptEntity>? careerAssessmentResult,
    UiResult<List<SuggestedCareerEntity>>? checkCareerAssessmentAnswersResult,
    Map<String, QuestionAnswerEntity>? questionAnswers,
    int? currentQuestionIndex,
  }) {
    return CareerAssessmentState(
      careerAssessmentResult:
          careerAssessmentResult ?? this.careerAssessmentResult,
      checkCareerAssessmentAnswersResult:
          checkCareerAssessmentAnswersResult ??
          this.checkCareerAssessmentAnswersResult,
      questionAnswers: questionAnswers ?? this.questionAnswers,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
    );
  }
}

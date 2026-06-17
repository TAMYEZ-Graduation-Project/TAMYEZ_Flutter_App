import 'package:injectable/injectable.dart';

import '../../../../../../core/constants/app_enums.dart'
    show QuizQuestionTypesEnum, QuestionOptionIdsEnum;
import '../../../../../../core/entities/get_quiz_questions_entity.dart';
import '../../../../../../core/entities/question_answer_entity.dart'
    show QuestionAnswerEntity;
import '../../../../../../core/execution/operation_result.dart';
import '../../../../../../core/presentation/bases/base_cubit.dart';
import '../../../../../../core/presentation/result/ui_effect.dart';
import '../../../../../../core/presentation/result/ui_result.dart';
import '../../../../../../core/utils/functions/safe_print.dart';
import '../../../../domain/use_cases/get_career_assessment_questions.dart';
import 'career_assessment_intent.dart';
import 'career_assessment_state.dart';

@injectable
class CareerAssessmentViewModel
    extends BaseCubit<CareerAssessmentState, UiEffect> {
  final GetCareerAssessmentQuestionsUseCase
  _getCareerAssessmentQuestionsUseCase;

  CareerAssessmentViewModel(this._getCareerAssessmentQuestionsUseCase)
    : super(const CareerAssessmentState());

  Future<void> doIntent(CareerAssessmentIntent intent) async {
    switch (intent) {
      case GetCareerAssessmentQuestionsIntent():
        await _getCareerAssessmentQuestions();
      case SelectSingleChoiceAnswerIntent():
        _selectSingleChoiceAnswer(intent);
      case SelectMultiChoiceAnswerIntent():
        _selectMultiChoiceAnswer(intent);
      case SelectWrittenAnswerIntent():
        _selectWrittenAnswer(intent);
      case OnNextTapIntent():
        _onNextTap();
      case OnBackTapIntent():
        _onBackTap();
      case OnSubmitTapIntent():
        safePrint('Submitted');
    }
  }

  Future<void> _getCareerAssessmentQuestions() async {
    emit(state.copyWith(careerAssessmentResult: const Loading()));

    final result = await _getCareerAssessmentQuestionsUseCase();

    switch (result) {
      case OperationSuccess<QuizAttemptEntity>():
        emit(state.copyWith(careerAssessmentResult: Success(result.data)));
      case OperationFailure<QuizAttemptEntity>():
        emit(state.copyWith(careerAssessmentResult: Error(result.failure)));
    }
  }

  void _selectSingleChoiceAnswer(SelectSingleChoiceAnswerIntent intent) {
    final answers = Map<String, QuestionAnswerEntity>.from(
      state.questionAnswers,
    );
    answers[intent.questionId] = QuestionAnswerEntity(
      questionId: intent.questionId,
      type: QuizQuestionTypesEnum.mcqSingle,
      answer: [intent.optionId],
    );
    emit(state.copyWith(questionAnswers: answers));
  }

  void _selectMultiChoiceAnswer(SelectMultiChoiceAnswerIntent intent) {
    final answers = Map<String, QuestionAnswerEntity>.from(
      state.questionAnswers,
    );

    List<QuestionOptionIdsEnum> newOptions = [];
    if (answers[intent.questionId] != null) {
      if (!intent.gotSelected) {
        newOptions = answers[intent.questionId]!.answer
            .where((element) => element != intent.optionId)
            .toList();
      } else {
        newOptions = [...answers[intent.questionId]!.answer, intent.optionId];
      }
    } else {
      newOptions = [intent.optionId];
    }

    answers[intent.questionId] = QuestionAnswerEntity(
      questionId: intent.questionId,
      type: QuizQuestionTypesEnum.mcqMulti,
      answer: newOptions,
    );
    emit(state.copyWith(questionAnswers: answers));
  }

  void _selectWrittenAnswer(SelectWrittenAnswerIntent intent) {
    final answers = Map<String, QuestionAnswerEntity>.from(
      state.questionAnswers,
    );

    answers[intent.questionId] = QuestionAnswerEntity(
      questionId: intent.questionId,
      writtenAnswer: intent.answer,
    );
    emit(state.copyWith(questionAnswers: answers));
  }

  void _onNextTap() {
    final question =
        (state.careerAssessmentResult as Success<QuizAttemptEntity>)
            .data
            .questions[state.currentQuestionIndex];
    if (state.questionAnswers[question.id] == null) {
      final answers = Map<String, QuestionAnswerEntity>.from(
        state.questionAnswers,
      );
      answers[question.id] = QuestionAnswerEntity(
        questionId: question.id,
        type: question.type,
        answer: const [QuestionOptionIdsEnum.empty],
        writtenAnswer: question.type == QuizQuestionTypesEnum.written
            ? ''
            : null,
      );
    }
    emit(state.copyWith(currentQuestionIndex: state.currentQuestionIndex + 1));
    emitEffect(PageNavigationEffect(page: state.currentQuestionIndex));
  }

  void _onBackTap() {
    emit(state.copyWith(currentQuestionIndex: state.currentQuestionIndex - 1));
    emitEffect(PageNavigationEffect(page: state.currentQuestionIndex));
  }
}

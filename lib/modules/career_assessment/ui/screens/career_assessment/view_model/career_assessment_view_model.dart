import 'package:injectable/injectable.dart';

import '../../../../../../core/constants/app_enums.dart'
    show QuizQuestionTypesEnum, QuestionOptionIdsEnum;
import '../../../../../../core/entities/check_question_answers_param.dart';
import '../../../../../../core/entities/get_quiz_questions_entity.dart';
import '../../../../../../core/entities/question_answer_entity.dart'
    show QuestionAnswerEntity;
import '../../../../../../core/execution/operation_result.dart';
import '../../../../../../core/presentation/bases/base_cubit.dart';
import '../../../../../../core/presentation/mixins/effects_handling_mixin.dart';
import '../../../../../../core/presentation/result/ui_effect.dart';
import '../../../../../../core/presentation/result/ui_result.dart';
import '../../../../../../core/presentation/routing/defined_routes.dart'
    show DefinedRoutes;
import '../../../../domain/entities/check_career_assessment_answers_response_entity.dart';
import '../../../../domain/use_cases/check_career_assessment_answers_use_case.dart';
import '../../../../domain/use_cases/get_career_assessment_questions.dart';
import 'career_assessment_intent.dart';
import 'career_assessment_state.dart';

@injectable
class CareerAssessmentViewModel
    extends BaseCubit<CareerAssessmentState, UiEffect> {
  final GetCareerAssessmentQuestionsUseCase
  _getCareerAssessmentQuestionsUseCase;

  final CheckCareerAssessmentAnswersUseCase
  _checkCareerAssessmentAnswersUseCase;

  CareerAssessmentViewModel(
    this._getCareerAssessmentQuestionsUseCase,
    this._checkCareerAssessmentAnswersUseCase,
  ) : super(const CareerAssessmentState());

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
        _onSubmit();
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

  void _checkIfQuestionNotAnsweredBeforePreceding() {
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
            ? ' '
            : null,
      );
      emit(state.copyWith(questionAnswers: answers));
    }
  }

  void _onNextTap() {
    _checkIfQuestionNotAnsweredBeforePreceding();
    emit(state.copyWith(currentQuestionIndex: state.currentQuestionIndex + 1));
    emitEffect(PageNavigationEffect(page: state.currentQuestionIndex));
  }

  void _onBackTap() {
    emit(state.copyWith(currentQuestionIndex: state.currentQuestionIndex - 1));
    emitEffect(PageNavigationEffect(page: state.currentQuestionIndex));
  }

  Future<void> _onSubmit() async {
    _checkIfQuestionNotAnsweredBeforePreceding();
    emit(state.copyWith(checkCareerAssessmentAnswersResult: const Loading()));
    final result = await _checkCareerAssessmentAnswersUseCase(
      quizAttemptId:
          (state.careerAssessmentResult as Success<QuizAttemptEntity>).data.id,
      params: CheckQuestionAnswersParams(
        answers: state.questionAnswers.values.toList(),
      ),
    );

    switch (result) {
      case OperationSuccess<List<SuggestedCareerEntity>>():
        emitEffect(
          NavigateEffect(
            route: DefinedRoutes.topCareerMatchesRoute,
            navigationType: NavigationTypeEnum.pushReplacementNamed,
            argument: result.data,
          ),
        );
      case OperationFailure<List<SuggestedCareerEntity>>():
        emit(
          state.copyWith(
            checkCareerAssessmentAnswersResult: Error(result.failure),
          ),
        );
        emitEffect(DisplayErrorEffect(failure: result.failure));
    }
  }
}

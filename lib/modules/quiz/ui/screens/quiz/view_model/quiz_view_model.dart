import 'package:injectable/injectable.dart';

import '../../../../../../core/constants/app_enums.dart';
import '../../../../../../core/entities/check_question_answers_param.dart';
import '../../../../../../core/entities/get_quiz_questions_entity.dart';
import '../../../../../../core/entities/question_answer_entity.dart';
import '../../../../../../core/error/failures/app_failures.dart';
import '../../../../../../core/execution/operation_result.dart';
import '../../../../../../core/presentation/bases/base_cubit.dart';
import '../../../../../../core/presentation/mixins/effects_handling_mixin.dart';
import '../../../../../../core/presentation/result/ui_effect.dart';
import '../../../../../../core/presentation/result/ui_result.dart';
import '../../../../../../core/presentation/routing/defined_routes.dart';
import '../../../../../../core/utils/counter/count_down_utility.dart';
import '../../../../domain/entities/quiz_result_response_entity.dart';
import '../../../../domain/use_cases/check_quiz_answers_use_case.dart';
import '../../../../domain/use_cases/get_quiz_questions_use_case.dart';
import 'quiz_intent.dart';
import 'quiz_state.dart';

@injectable
class QuizViewModel extends BaseCubit<QuizState, UiEffect> {
  final GetQuizQuestionsUseCase _getQuizQuestionsUseCase;
  final CheckQuizAnswersUseCase _checkQuizAnswersUseCase;

  final CountDownUtility _countDownUtility;

  QuizViewModel(
    this._getQuizQuestionsUseCase,
    this._checkQuizAnswersUseCase,
    this._countDownUtility,
  ) : super(const QuizState());

  Future<void> doIntent(QuizIntent intent) async {
    switch (intent) {
      case GetQuizQuestionsIntent():
        await _getQuizQuestions(intent);
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

  Future<void> _getQuizQuestions(GetQuizQuestionsIntent intent) async {
    emit(state.copyWith(quizAttemptResult: const Loading()));
    final result = await _getQuizQuestionsUseCase(
      quizId: intent.quizId,
      roadmapStepId: intent.stepId,
    );

    switch (result) {
      case OperationSuccess<QuizAttemptEntity>():
        emit(
          state.copyWith(
            quizAttemptResult: Success(result.data),
            remainingDuration: intent.duration,
          ),
        );
        _startTimer(intent.duration);
      case OperationFailure<QuizAttemptEntity>():
        emit(state.copyWith(quizAttemptResult: Error(result.failure)));
    }
  }

  void _startTimer(int durationInSeconds) {
    _countDownUtility.startCountdown(
      seconds: durationInSeconds,
      onTick: (remaining) {
        emit(state.copyWith(remainingDuration: remaining));
      },
      onFinished: () {
        emit(state.copyWith(remainingDuration: 0));
        emitEffect(const DisplayTimeOutEffect());
      },
    );
  }

  void _checkIfThereUnAnsweredQuestions() {
    final answers = Map<String, QuestionAnswerEntity>.from(
      state.questionAnswers,
    );
    final questions =
        (state.quizAttemptResult as Success<QuizAttemptEntity>).data.questions;
    for (final unAnsweredQuestion in state.unAnsweredQuestions.keys) {
      final type =
          questions[state.unAnsweredQuestions[unAnsweredQuestion]!].type;
      answers[unAnsweredQuestion] = QuestionAnswerEntity(
        questionId: unAnsweredQuestion,
        type: type,
        answer: const [QuestionOptionIdsEnum.empty],
        writtenAnswer: type == QuizQuestionTypesEnum.written ? ' ' : null,
      );
    }
    emit(state.copyWith(questionAnswers: answers));
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
    final question = (state.quizAttemptResult as Success<QuizAttemptEntity>)
        .data
        .questions[state.currentQuestionIndex];
    if (state.questionAnswers[question.id] == null) {
      final unAnsweredQuestions = Map<String, int>.from(
        state.unAnsweredQuestions,
      );
      unAnsweredQuestions[question.id] = state.currentQuestionIndex;
      emit(state.copyWith(unAnsweredQuestions: unAnsweredQuestions));
    } else if (state.unAnsweredQuestions[question.id] != null) {
      final unAnsweredQuestions = Map<String, int>.from(
        state.unAnsweredQuestions,
      )..remove(question.id);
      emit(state.copyWith(unAnsweredQuestions: unAnsweredQuestions));
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

    if (state.unAnsweredQuestions.isNotEmpty && state.remainingDuration > 0) {
      emitEffect(
        const DisplayWarningEffect(
          failure: NotAllQuizQuestionsAnsweredFailure(),
        ),
      );
      return;
    } else {
      _checkIfThereUnAnsweredQuestions();
    }

    emit(state.copyWith(quizAnswersResult: const Loading()));
    final result = await _checkQuizAnswersUseCase(
      quizAttemptId:
          (state.quizAttemptResult as Success<QuizAttemptEntity>).data.id,
      params: CheckQuestionAnswersParams(
        answers: state.questionAnswers.values.toList(),
      ),
    );
    switch (result) {
      case OperationSuccess<QuizResultEntity>():
        emit(state.copyWith(quizAnswersResult: Success(result.data)));
        emitEffect(
          NavigateEffect(
            route: DefinedRoutes.quizResultRoute,
            navigationType: NavigationTypeEnum.pushReplacementNamed,
            argument: result.data,
          ),
        );
      case OperationFailure<QuizResultEntity>():
        emit(state.copyWith(quizAnswersResult: Error(result.failure)));
        emitEffect(DisplayErrorEffect(failure: result.failure));
    }
  }

  @override
  Future<void> close() {
    _countDownUtility.cancelCountdown();
    return super.close();
  }
}

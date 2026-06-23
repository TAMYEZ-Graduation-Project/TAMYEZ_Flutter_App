import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/di.dart' show getIt;
import '../../../../../core/entities/get_quiz_questions_entity.dart';
import '../../../../../core/entities/question_answer_entity.dart'
    show QuestionAnswerEntity;
import '../../../../../core/presentation/bases/base_stateful_widget_state.dart';
import '../../../../../core/presentation/error/failure_message_mapper.dart';
import '../../../../../core/presentation/mixins/effects_handling_mixin.dart';
import '../../../../../core/presentation/result/ui_effect.dart'
    show PageNavigationEffect, DisplayErrorEffect;
import '../../../../../core/presentation/result/ui_result.dart';
import '../../../../../core/presentation/utils/dialogs/app_dialogs.dart';
import '../../../../../core/presentation/widgets/app_error_widget.dart';
import '../../../../../core/presentation/widgets/app_loading_widget.dart';
import '../../../../../core/presentation/widgets/career_assessment_loading_overlay.dart';
import '../../../../../core/presentation/widgets/next_and_back_row_widget.dart';
import '../../../../../core/presentation/widgets/question_widget_factory.dart'
    show QuestionWidgetFactory;
import '../../../../../core/presentation/widgets/questions_progress_bar_widget.dart'
    show QuestionsProgressBarWidget;
import '../../../domain/entities/check_career_assessment_answers_response_entity.dart';
import 'view_model/career_assessment_intent.dart';
import 'view_model/career_assessment_state.dart';
import 'view_model/career_assessment_view_model.dart';

class CareerAssessmentScreen extends StatefulWidget {
  const CareerAssessmentScreen({super.key});

  @override
  State<CareerAssessmentScreen> createState() => _CareerAssessmentScreenState();
}

class _CareerAssessmentScreenState
    extends BaseStatefulWidgetState<CareerAssessmentScreen>
    with EffectsHandlingMixin {
  final CareerAssessmentViewModel _viewModel = getIt.get();
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _viewModel.doIntent(const GetCareerAssessmentQuestionsIntent());
    _viewModel.effectStream.listen((event) {
      switch (event) {
        case PageNavigationEffect():
          _pageController.jumpToPage(event.page);
        case DisplayErrorEffect():
          if (!mounted) return;
          AppDialogs.defaultDialog(
            context,
            title: appLocalizations.error,
            firstButtonText: appLocalizations.ok,
            content: FailureHandling.mapFailureToMessage(
              appLocalizations,
              event.failure,
            ),
          );
        default:
          handleEffects(event);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _viewModel,
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text(appLocalizations.tamyez),
              centerTitle: true,
            ),
            body: BlocBuilder<CareerAssessmentViewModel, CareerAssessmentState>(
              buildWhen: (previous, current) {
                return previous.careerAssessmentResult !=
                    current.careerAssessmentResult;
              },
              builder: (context, state) {
                final result = state.careerAssessmentResult;
                switch (result) {
                  case Initial<QuizAttemptEntity>():
                  case Loading<QuizAttemptEntity>():
                    return const AppLoadingWidget();
                  case Success<QuizAttemptEntity>():
                    final questions = result.data.questions;
                    final int questionsLength = questions.length;
                    return SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 16.0,
                        ),
                        child: Column(
                          spacing: 12,
                          children: [
                            BlocSelector<
                              CareerAssessmentViewModel,
                              CareerAssessmentState,
                              int
                            >(
                              selector: (state) => state.currentQuestionIndex,
                              builder: (context, currentQuestionIndex) {
                                return QuestionsProgressBarWidget(
                                  currentQuestionIndex: currentQuestionIndex,
                                  totalQuestions: questionsLength,
                                );
                              },
                            ),
                            const SizedBox(height: 16),
                            BlocSelector<
                              CareerAssessmentViewModel,
                              CareerAssessmentState,
                              Map<String, QuestionAnswerEntity>
                            >(
                              selector: (state) => state.questionAnswers,
                              builder: (context, questionAnswers) {
                                return Expanded(
                                  flex: 10,
                                  child: PageView.builder(
                                    controller: _pageController,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: questionsLength,
                                    itemBuilder: (context, index) {
                                      return QuestionWidgetFactory.create(
                                        question: questions[index],
                                        type: questions[index].type,
                                        selectedOptionsIds:
                                            questionAnswers[questions[index].id]
                                                ?.answer,
                                        writtenAnswer:
                                            questionAnswers[questions[index].id]
                                                ?.writtenAnswer,
                                        onOptionSelected: (optionId) {
                                          _viewModel.doIntent(
                                            SelectSingleChoiceAnswerIntent(
                                              questionId: questions[index].id,
                                              optionId: optionId,
                                            ),
                                          );
                                        },
                                        onMultiOptionSelected:
                                            (value, optionId) {
                                              _viewModel.doIntent(
                                                SelectMultiChoiceAnswerIntent(
                                                  questionId:
                                                      questions[index].id,
                                                  gotSelected: value,
                                                  optionId: optionId,
                                                ),
                                              );
                                            },
                                        onWrittenAnswerChange: (value) {
                                          _viewModel.doIntent(
                                            SelectWrittenAnswerIntent(
                                              questionId: questions[index].id,
                                              answer: value,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                            const Spacer(),
                            BlocBuilder<
                              CareerAssessmentViewModel,
                              CareerAssessmentState
                            >(
                              buildWhen: (previous, current) {
                                final prev = previous.currentQuestionIndex;
                                final curr = current.currentQuestionIndex;
                                final isFirstPairSwap =
                                    (prev == 0 && curr == 1) ||
                                    (prev == 1 && curr == 0);
                                final isLastTwo = curr >= questionsLength - 2;
                                return isFirstPairSwap || isLastTwo;
                              },
                              builder: (context, state) {
                                return NextAndBackRowWidget(
                                  isFirstQuestion:
                                      state.currentQuestionIndex == 0,
                                  isLastQuestion:
                                      state.currentQuestionIndex ==
                                      questionsLength - 1,
                                  onNextTap: () {
                                    _viewModel.doIntent(
                                      const OnNextTapIntent(),
                                    );
                                  },
                                  onBackTap: () {
                                    _viewModel.doIntent(
                                      const OnBackTapIntent(),
                                    );
                                  },
                                  onSubmitTap: () {
                                    _viewModel.doIntent(
                                      const OnSubmitTapIntent(),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  case Error<QuizAttemptEntity>():
                    return AppErrorWidget(
                      failure: result.failure,
                      onRetry: () {
                        _viewModel.doIntent(
                          const GetCareerAssessmentQuestionsIntent(),
                        );
                      },
                    );
                }
              },
            ),
          ),

          BlocSelector<
            CareerAssessmentViewModel,
            CareerAssessmentState,
            UiResult<List<SuggestedCareerEntity>>
          >(
            selector: (state) => state.checkCareerAssessmentAnswersResult,
            builder: (context, result) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: switch (result) {
                  Loading() => const CareerAssessmentLoadingOverlay(),
                  _ => const SizedBox.shrink(),
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

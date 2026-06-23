import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/entities/get_quiz_questions_entity.dart';
import '../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../core/presentation/bases/base_stateful_widget_state.dart';
import '../../../../../core/presentation/error/failure_message_mapper.dart';
import '../../../../../core/presentation/mixins/effects_handling_mixin.dart';
import '../../../../../core/presentation/result/ui_effect.dart';
import '../../../../../core/presentation/result/ui_result.dart';
import '../../../../../core/presentation/utils/dialogs/app_dialogs.dart';
import '../../../../../core/presentation/widgets/app_error_widget.dart';
import '../../../../../core/presentation/widgets/app_loading_widget.dart';
import '../../../../../core/presentation/widgets/career_assessment_loading_overlay.dart';
import '../../../../../core/presentation/widgets/next_and_back_row_widget.dart';
import '../../../../career_assessment/domain/quiz_screen_params.dart';
import '../../../domain/entities/quiz_result_response_entity.dart';
import 'sections/question_progress_and_time_section.dart';
import 'sections/questions_page_view_section.dart';
import 'view_model/quiz_intent.dart';
import 'view_model/quiz_state.dart';
import 'view_model/quiz_view_model.dart';

class QuizScreen extends StatefulWidget {
  final QuizScreenParams params;

  const QuizScreen({super.key, required this.params});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends BaseStatefulWidgetState<QuizScreen>
    with EffectsHandlingMixin {
  final QuizViewModel _viewModel = getIt.get();

  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _viewModel.doIntent(
      GetQuizQuestionsIntent(
        quizId: widget.params.quizId,
        stepId: widget.params.stepId,
        duration: widget.params.duration,
      ),
    );
    _viewModel.effectStream.listen((event) {
      switch (event) {
        case PageNavigationEffect():
          _pageController.jumpToPage(event.page);
        case DisplayErrorEffect():
          if (!mounted) return;
          AppDialogs.defaultDialog(
            context,
            dismissible: false,
            title: appLocalizations.error,
            firstButtonText: appLocalizations.retry,
            firstButtonAction: () {
              _viewModel.doIntent(const OnSubmitTapIntent());
            },
            secondButtonText: appLocalizations.leave,
            secondButtonAction: () {
              Navigator.pop(context);
            },
            content: FailureHandling.mapFailureToMessage(
              appLocalizations,
              event.failure,
            ),
          );
        case DisplayTimeOutEffect():
          if (!mounted) return;
          timeOutDialog();
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
              title: Text(appLocalizations.quiz),
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  AppDialogs.defaultDialog(
                    context,
                    content: appLocalizations.exitQuizConfirmation,
                    contentStyle: typography.subTitle,
                    firstButtonText: appLocalizations.no,
                    secondButtonText: appLocalizations.yes,
                    secondButtonAction: () {
                      Navigator.pop(context);
                    },
                  );
                },
                icon: const Icon(Icons.close_sharp),
              ),
            ),
            body: BlocBuilder<QuizViewModel, QuizState>(
              buildWhen: (previous, current) {
                return previous.quizAttemptResult != current.quizAttemptResult;
              },
              builder: (context, state) {
                final result = state.quizAttemptResult;
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
                            QuestionsProgressAndTimeSection(
                              questionsLength: questionsLength,
                            ),
                            const SizedBox(height: 16),
                            QuestionsPageViewSection(
                              pageController: _pageController,
                              questionsLength: questionsLength,
                              questions: questions,
                            ),
                            const Spacer(),
                            BlocBuilder<QuizViewModel, QuizState>(
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
                          GetQuizQuestionsIntent(
                            quizId: widget.params.quizId,
                            stepId: widget.params.stepId,
                            duration: widget.params.duration,
                          ),
                        );
                      },
                    );
                }
              },
            ),
          ),

          BlocSelector<QuizViewModel, QuizState, UiResult<QuizResultEntity>>(
            selector: (state) => state.quizAnswersResult,
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

  Future<void> timeOutDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Text(
            appLocalizations.timeOut,
            textAlign: TextAlign.center,
            style: typography.title.copyWith(color: AppColors.red),
          ),
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 24.0,
                  ),
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _viewModel.doIntent(const OnSubmitTapIntent());
                    },
                    child: Text(appLocalizations.viewResult),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

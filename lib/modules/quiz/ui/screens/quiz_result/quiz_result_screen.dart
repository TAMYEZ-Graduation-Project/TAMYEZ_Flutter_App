import 'package:flutter/material.dart';

import '../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../core/presentation/routing/defined_routes.dart';
import '../../../../../core/presentation/utils/dialogs/app_dialogs.dart';
import '../../../domain/entities/quiz_result_response_entity.dart';
import 'sections/correct_answers_bar_section.dart';
import 'sections/greeting_section.dart';
import 'sections/performance_summary_section.dart';

class QuizResultScreen extends BaseStatelessWidget {
  final QuizResultEntity quizResult;

  const QuizResultScreen({super.key, required this.quizResult});

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Scaffold(
      appBar: AppBar(
        title: Text(d.appLocalizations.quizResults),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              DefinedRoutes.homeRoute,
              (route) => false,
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CorrectAnswersBarSection(
                        correctAnswersCount: quizResult.correctAnswersCount
                            .toInt(),
                        totalQuestions: quizResult.mcqTotal.toInt(),
                      ),
                      const GreetingSection(),
                      PerformanceSummarySection(
                        correctAnswersCount: quizResult.correctAnswersCount
                            .toInt(),
                        wrongAnswersCount: quizResult.wrongAnswersCount.toInt(),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        d.appLocalizations.writtenQuestions(
                          quizResult.writtenTotal,
                        ),
                        style: d.typography.title,
                      ),
                      Text(
                        d.appLocalizations.writtenQuestionsScore(
                          quizResult.writtenScore,
                        ),
                        style: d.typography.title,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: () {
                  if (quizResult.finalScore < 50) {
                    AppDialogs.defaultDialog(
                      context,
                      content: d.appLocalizations.lowScoreReviewWarning,
                      contentTextAlign: TextAlign.center,
                      contentStyle: d.typography.title.copyWith(
                        color: AppColors.red,
                      ),
                    );
                    return;
                  }
                  Navigator.pushNamed(
                    context,
                    DefinedRoutes.savedQuizRoute,
                    arguments: quizResult.savedQuizId,
                  );
                },
                child: Text(d.appLocalizations.reviewAnswers),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

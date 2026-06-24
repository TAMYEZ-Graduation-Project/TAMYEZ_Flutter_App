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
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CorrectAnswersBarSection(
                correctAnswersCount: quizResult.correctAnswersCount.toInt(),
                totalQuestions: quizResult.totalQuestions.toInt(),
              ),
              const GreetingSection(),
              PerformanceSummarySection(
                correctAnswersCount: quizResult.correctAnswersCount.toInt(),
                wrongAnswersCount: quizResult.wrongAnswersCount.toInt(),
              ),
              const Spacer(),
              FilledButton(
                onPressed: () {
                  if (int.parse(quizResult.score.replaceAll('%', '')) < 50) {
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

import 'package:flutter/material.dart';

import '../../../../../../core/presentation/bases/base_stateless_widget.dart';

class QuestionsProgressBarWidget extends BaseStatelessWidget {
  final int currentQuestionIndex;
  final int totalQuestions;

  const QuestionsProgressBarWidget({
    super.key,
    required this.currentQuestionIndex,
    required this.totalQuestions,
  });

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12,
      children: [
        Text(
          d.appLocalizations.questionCounter(
            currentQuestionIndex + 1,
            totalQuestions,
          ),
          style: d.typography.subTitle,
        ),
        LinearProgressIndicator(
          value: (currentQuestionIndex + 1) / totalQuestions,
        ),
      ],
    );
  }
}

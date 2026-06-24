import 'package:flutter/material.dart';

import '../../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';

class CorrectAnswersBarSection extends BaseStatelessWidget {
  final int correctAnswersCount;
  final int totalQuestions;

  const CorrectAnswersBarSection({
    super.key,
    required this.correctAnswersCount,
    required this.totalQuestions,
  });

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12,
      children: [
        Text(
          '$correctAnswersCount/$totalQuestions',
          style: d.typography.subTitle,
        ),
        LinearProgressIndicator(value: correctAnswersCount / totalQuestions),
        Text(
          d.appLocalizations.correctAnswers.replaceAll('\n', ' '),
          style: d.typography.body.copyWith(color: AppColors.blue),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../../core/extensions/quiz_duration_formatter.dart';
import '../../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../domain/entities/exam_preparation_screen_params.dart';

class QuizDetailsSection extends BaseStatelessWidget {
  final ExamPreparationScreenParams params;

  const QuizDetailsSection({super.key, required this.params});

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(d.appLocalizations.quizDetails, style: d.typography.title),
            Container(
              width: d.screenSize.width / 6,
              margin: const EdgeInsets.only(top: 8, right: 22),
              height: 1,
              color: AppColors.middleBlue,
            ),
          ],
        ),
        _DetailItemWidget(
          itemTitle: d.appLocalizations.topic,
          itemValue: params.stepTitle,
        ),
        _DetailItemWidget(
          itemTitle: d.appLocalizations.numberOfQuestions,
          itemValue: params.quiz.questionsNumber.toInt().toString(),
        ),
        _DetailItemWidget(
          itemTitle: d.appLocalizations.timeLimit,
          itemValue: params.quiz.duration.toInt().toHoursMinutes(),
        ),
      ],
    );
  }
}

class _DetailItemWidget extends BaseStatelessWidget {
  final String itemTitle;
  final String itemValue;

  const _DetailItemWidget({required this.itemTitle, required this.itemValue});

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          itemTitle,
          style: d.typography.body.copyWith(color: AppColors.blue),
        ),
        Text(itemValue, style: d.typography.body),
        Container(
          width: d.screenSize.width - (d.screenSize.width / 2.5),
          margin: const EdgeInsets.only(top: 4),
          height: 1,
          color: AppColors.middleBlue,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';

class PerformanceSummarySection extends BaseStatelessWidget {
  final int correctAnswersCount;
  final int wrongAnswersCount;

  const PerformanceSummarySection({
    super.key,
    required this.correctAnswersCount,
    required this.wrongAnswersCount,
  });

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(d.appLocalizations.performanceSummary, style: d.typography.title),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _PerformanceSummaryCard(
              title: d.appLocalizations.correctAnswers,
              value: correctAnswersCount,
            ),
            _PerformanceSummaryCard(
              title: d.appLocalizations.wrongAnswers,
              value: wrongAnswersCount,
            ),
          ],
        ),
      ],
    );
  }
}

class _PerformanceSummaryCard extends BaseStatelessWidget {
  final String title;
  final int value;

  const _PerformanceSummaryCard({required this.title, required this.value});

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Container(
      width: d.screenSize.width / 2.6,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.darkGray.withAlpha(90)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: d.typography.subTitle),
            Text('$value', style: d.typography.title),
          ],
        ),
      ),
    );
  }
}

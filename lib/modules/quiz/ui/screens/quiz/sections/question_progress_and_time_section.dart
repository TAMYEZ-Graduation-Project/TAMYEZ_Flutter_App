import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/asset_paths.dart';
import '../../../../../../core/extensions/time_formatting.dart';
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../../core/presentation/widgets/questions_progress_bar_widget.dart';
import '../view_model/quiz_state.dart';
import '../view_model/quiz_view_model.dart';

class QuestionsProgressAndTimeSection extends BaseStatelessWidget {
  final int questionsLength;

  const QuestionsProgressAndTimeSection({
    super.key,
    required this.questionsLength,
  });

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Stack(
      alignment: AlignmentGeometry.topRight,
      children: [
        BlocSelector<QuizViewModel, QuizState, int>(
          selector: (state) => state.currentQuestionIndex,
          builder: (context, currentQuestionIndex) {
            return QuestionsProgressBarWidget(
              currentQuestionIndex: currentQuestionIndex,
              totalQuestions: questionsLength,
            );
          },
        ),
        BlocSelector<QuizViewModel, QuizState, int>(
          selector: (state) => state.remainingDuration,
          builder: (context, duration) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImageIcon(
                  const AssetImage(AssetPaths.greenClock),
                  color: duration <= 300 ? Colors.red : Colors.green,
                ),
                const SizedBox(width: 4),
                Text(
                  duration.toTimeFormat(),
                  style: d.typography.subTitle.copyWith(
                    fontWeight: FontWeight.w700,
                    color: duration <= 300 ? Colors.red : Colors.green,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../../core/extensions/text_direction_detector_extension.dart';
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../../core/presentation/utils/question_answer_options/question_answer_options_util.dart';
import '../../../../domain/entities/get_saved_quiz_entity.dart';

class MultiChoiceQuestionAnswerWidget extends BaseStatelessWidget {
  final SavedQuizQuestionEntity question;

  const MultiChoiceQuestionAnswerWidget({super.key, required this.question});

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12,
      children: [
        Text(
          question.text,
          textDirection: question.text.textDirection,
          style: d.typography.title,
        ),
        ListView.separated(
          itemCount: question.options.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return const SizedBox(height: 12);
          },
          itemBuilder: (context, index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  color: QuestionAnswerOptionsUtil.getOptionBorderColor(
                    option: question.options[index],
                    question: question,
                  ),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                title: Text(
                  question.options[index].text,
                  style: d.typography.body,
                ),
                leading: QuestionAnswerOptionsUtil.getOptionCheckBoxIcon(
                  option: question.options[index],
                  question: question,
                ),
              ),
            );
          },
        ),
        if (!question.isCorrect && question.explanation.isNotEmpty)
          Text(
            'Explanation:\n${question.explanation}',
            style: d.typography.body,
          ),
      ],
    );
  }
}

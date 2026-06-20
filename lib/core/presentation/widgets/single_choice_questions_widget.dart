import 'package:flutter/material.dart';

import '../../constants/app_enums.dart';
import '../../entities/get_quiz_questions_entity.dart';
import '../../layers/theme/colors/app_colors.dart';
import '../bases/base_stateless_widget.dart';

class SingleChoiceQuestionWidget extends BaseStatelessWidget {
  final QuestionEntity question;
  final QuestionOptionIdsEnum? selectedOptionId;
  final void Function(QuestionOptionIdsEnum optionId)? onOptionSelected;

  const SingleChoiceQuestionWidget({
    super.key,
    required this.question,
    required this.onOptionSelected,
    this.selectedOptionId,
  });

  final List<QuestionOptionIdsEnum> options = QuestionOptionIdsEnum.values;

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Column(
      spacing: 12,
      children: [
        Text(question.text, style: d.typography.title),
        RadioGroup<QuestionOptionIdsEnum>(
          groupValue: selectedOptionId,
          onChanged: (value) {
            onOptionSelected?.call(value!);
          },
          child: ListView.separated(
            itemCount: question.options.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 12);
            },
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  onOptionSelected?.call(options[index + 1]);
                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.middleBlue),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    title: Text(
                      question.options[index].text,
                      style: d.typography.body,
                    ),
                    leading: Radio<QuestionOptionIdsEnum>(
                      value: options[index + 1],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

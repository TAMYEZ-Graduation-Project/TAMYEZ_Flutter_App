import 'package:flutter/material.dart';

import '../../constants/app_enums.dart';
import '../../entities/get_quiz_questions_entity.dart';
import '../../extensions/text_direction_detector_extension.dart';
import '../../layers/theme/colors/app_colors.dart';
import '../bases/base_stateless_widget.dart';

class MultiChoiceQuestionWidget extends BaseStatelessWidget {
  final QuestionEntity question;
  final List<QuestionOptionIdsEnum>? selectedOptionsIds;
  final void Function(bool value, QuestionOptionIdsEnum optionId)?
  onOptionSelected;

  const MultiChoiceQuestionWidget({
    super.key,
    required this.question,
    required this.onOptionSelected,
    this.selectedOptionsIds,
  });

  final List<QuestionOptionIdsEnum> options = QuestionOptionIdsEnum.values;

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return SingleChildScrollView(
      child: Column(
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
              final bool isSelected =
                  selectedOptionsIds?.contains(options[index + 1]) ?? false;
              return GestureDetector(
                onTap: () {
                  onOptionSelected?.call(!isSelected, options[index + 1]);
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
                    leading: Checkbox(
                      value: isSelected,
                      onChanged: (value) {
                        onOptionSelected?.call(value!, options[index + 1]);
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

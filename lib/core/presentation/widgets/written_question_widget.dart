import 'package:flutter/material.dart';

import '../../constants/app_enums.dart';
import '../../entities/get_quiz_questions_entity.dart';
import '../bases/base_stateless_widget.dart';

class WrittenQuestionWidget extends BaseStatelessWidget {
  final QuestionEntity question;
  final TextEditingController? controller;

  const WrittenQuestionWidget({
    super.key,
    required this.question,
    this.controller,
  });

  final List<QuestionOptionIdsEnum> options = QuestionOptionIdsEnum.values;

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Column(
      spacing: 12,
      children: [
        Text(question.text, style: d.typography.title),
        TextFormField(
          minLines: 5,
          maxLines: 15,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: const InputDecoration(hintText: 'Write your answer here'),
        ),
      ],
    );
  }
}

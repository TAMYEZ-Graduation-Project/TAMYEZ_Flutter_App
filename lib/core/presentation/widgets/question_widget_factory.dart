import 'package:flutter/material.dart';

import '../../constants/app_enums.dart';
import '../../entities/get_quiz_questions_entity.dart';
import 'multi_choice_questions_widget.dart';
import 'single_choice_questions_widget.dart';
import 'written_question_widget.dart';

class QuestionWidgetFactory {
  static Widget create({
    required QuizQuestionTypesEnum type,
    required QuestionEntity question,
    List<QuestionOptionIdsEnum>? selectedOptionsIds,
    void Function(QuestionOptionIdsEnum? optionId)? onOptionSelected,
    void Function(bool value, QuestionOptionIdsEnum optionId)?
    onMultiOptionSelected,
    TextEditingController? controller,
  }) {
    switch (type) {
      case QuizQuestionTypesEnum.mcqSingle:
        return SingleChoiceQuestionWidget(
          question: question,
          selectedOptionId: selectedOptionsIds?.first,
          onOptionSelected: onOptionSelected,
        );
      case QuizQuestionTypesEnum.mcqMulti:
        return MultiChoiceQuestionWidget(
          question: question,
          selectedOptionsIds: selectedOptionsIds,
          onOptionSelected: onMultiOptionSelected,
        );
      case QuizQuestionTypesEnum.written:
        return WrittenQuestionWidget(
          question: question,
          controller: controller,
        );
    }
  }
}

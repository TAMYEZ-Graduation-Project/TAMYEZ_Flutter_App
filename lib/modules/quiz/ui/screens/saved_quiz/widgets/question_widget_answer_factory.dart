import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_enums.dart';
import '../../../../domain/entities/get_saved_quiz_entity.dart';
import 'multi_choice_question_answer_widget.dart';
import 'single_choice_question_answer_widget.dart';
import 'written_question_answer_widget.dart';

abstract class QuestionWidgetAnswerFactory {
  static Widget create({
    required QuizQuestionTypesEnum type,
    required SavedQuizQuestionEntity question,
  }) {
    switch (type) {
      case QuizQuestionTypesEnum.mcqSingle:
        return SingleChoiceQuestionAnswerWidget(question: question);
      case QuizQuestionTypesEnum.mcqMulti:
        return MultiChoiceQuestionAnswerWidget(question: question);
      case QuizQuestionTypesEnum.written:
        return WrittenQuestionAnswerWidget(question: question);
    }
  }
}

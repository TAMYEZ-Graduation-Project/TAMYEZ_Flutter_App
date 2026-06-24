import 'dart:ui' show Color;

import 'package:flutter/material.dart' show Icon, Icons;

import '../../../../modules/quiz/domain/entities/get_saved_quiz_entity.dart'
    show SavedQuizOptionEntity, SavedQuizQuestionEntity;
import '../../../layers/theme/colors/app_colors.dart' show AppColors;

abstract class QuestionAnswerOptionsUtil {
  static Color getOptionBorderColor({
    required SavedQuizOptionEntity option,
    required SavedQuizQuestionEntity question,
  }) {
    if (question.userAnswer.contains(option.id)) {
      if (question.isCorrect) {
        return AppColors.green;
      } else {
        return AppColors.red;
      }
    } else if (question.correction.contains(option.id)) {
      return AppColors.green;
    } else {
      return AppColors.middleBlue;
    }
  }

  static Icon getOptionRadioIcon({
    required SavedQuizOptionEntity option,
    required SavedQuizQuestionEntity question,
  }) {
    if (question.userAnswer.contains(option.id)) {
      if (question.isCorrect) {
        return Icon(Icons.radio_button_checked, color: AppColors.green);
      } else {
        return Icon(Icons.radio_button_checked, color: AppColors.red);
      }
    } else if (question.correction.contains(option.id)) {
      return Icon(Icons.radio_button_checked, color: AppColors.green);
    } else {
      return Icon(Icons.radio_button_off, color: AppColors.middleBlue);
    }
  }

  static Icon getOptionCheckBoxIcon({
    required SavedQuizOptionEntity option,
    required SavedQuizQuestionEntity question,
  }) {
    if (question.userAnswer.contains(option.id)) {
      if (question.isCorrect) {
        return Icon(Icons.check_box, color: AppColors.green);
      } else {
        return Icon(Icons.check_box, color: AppColors.red);
      }
    } else if (question.correction.contains(option.id)) {
      return Icon(Icons.check_box, color: AppColors.green);
    } else {
      return Icon(Icons.check_box_outline_blank, color: AppColors.middleBlue);
    }
  }
}

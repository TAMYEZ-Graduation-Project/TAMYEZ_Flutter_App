import '../../../../../../core/constants/app_enums.dart';

sealed class QuizIntent {
  const QuizIntent();
}

class GetQuizQuestionsIntent extends QuizIntent {
  final String quizId;
  final String stepId;
  final int duration;

  const GetQuizQuestionsIntent({
    required this.quizId,
    required this.stepId,
    required this.duration,
  });
}

class SelectSingleChoiceAnswerIntent extends QuizIntent {
  final String questionId;
  final QuestionOptionIdsEnum optionId;

  const SelectSingleChoiceAnswerIntent({
    required this.questionId,
    required this.optionId,
  });
}

class SelectMultiChoiceAnswerIntent extends QuizIntent {
  final String questionId;
  final bool gotSelected;
  final QuestionOptionIdsEnum optionId;

  const SelectMultiChoiceAnswerIntent({
    required this.questionId,
    required this.gotSelected,
    required this.optionId,
  });
}

class SelectWrittenAnswerIntent extends QuizIntent {
  final String questionId;
  final String answer;

  const SelectWrittenAnswerIntent({
    required this.questionId,
    required this.answer,
  });
}

class OnNextTapIntent extends QuizIntent {
  const OnNextTapIntent();
}

class OnBackTapIntent extends QuizIntent {
  const OnBackTapIntent();
}

class OnSubmitTapIntent extends QuizIntent {
  const OnSubmitTapIntent();
}

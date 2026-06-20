import '../../../../../../core/constants/app_enums.dart';

sealed class CareerAssessmentIntent {
  const CareerAssessmentIntent();
}

class GetCareerAssessmentQuestionsIntent extends CareerAssessmentIntent {
  const GetCareerAssessmentQuestionsIntent();
}

class SelectSingleChoiceAnswerIntent extends CareerAssessmentIntent {
  final String questionId;
  final QuestionOptionIdsEnum optionId;

  const SelectSingleChoiceAnswerIntent({
    required this.questionId,
    required this.optionId,
  });
}

class SelectMultiChoiceAnswerIntent extends CareerAssessmentIntent {
  final String questionId;
  final bool gotSelected;
  final QuestionOptionIdsEnum optionId;

  const SelectMultiChoiceAnswerIntent({
    required this.questionId,
    required this.gotSelected,
    required this.optionId,
  });
}

class SelectWrittenAnswerIntent extends CareerAssessmentIntent {
  final String questionId;
  final String answer;

  const SelectWrittenAnswerIntent({
    required this.questionId,
    required this.answer,
  });
}

class OnNextTapIntent extends CareerAssessmentIntent {
  const OnNextTapIntent();
}

class OnBackTapIntent extends CareerAssessmentIntent {
  const OnBackTapIntent();
}

class OnSubmitTapIntent extends CareerAssessmentIntent {
  const OnSubmitTapIntent();
}

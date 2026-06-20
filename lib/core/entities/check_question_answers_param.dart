import 'question_answer_entity.dart';

class CheckQuestionAnswersParams {
  CheckQuestionAnswersParams({this.answers = const []});

  List<QuestionAnswerEntity> answers;
}

import 'question_answer_dto.dart';

class CheckQuestionAnswersRequest {
  CheckQuestionAnswersRequest({this.answers});

  List<QuestionAnswerDto>? answers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (answers != null) {
      map['answers'] = answers?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

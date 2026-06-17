class QuestionAnswerDto {
  QuestionAnswerDto({
    this.questionId,
    this.type,
    this.answer,
    this.writtenAnswer,
  });

  QuestionAnswerDto.fromJson(Map<String, dynamic> json) {
    questionId = json['questionId'] as String?;
    type = json['type'] as String?;
    answer = json['answer'] != null && json['answer'] is List
        ? json['answer'].cast<String>() as List<String>
        : [];
    writtenAnswer = json['answer'] != null && json['answer'] is String?
        ? json['answer'] as String
        : null;
  }

  String? questionId;
  String? type;
  List<String>? answer;
  String? writtenAnswer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['questionId'] = questionId;
    map['type'] = type;
    map['answer'] = writtenAnswer ?? answer;
    return map;
  }
}

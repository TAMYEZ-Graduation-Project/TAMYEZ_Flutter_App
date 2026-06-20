import 'package:equatable/equatable.dart';

import '../constants/app_enums.dart';

class QuestionAnswerEntity extends Equatable {
  const QuestionAnswerEntity({
    this.questionId = '',
    this.type = QuizQuestionTypesEnum.written,
    this.answer = const [],
    this.writtenAnswer,
  });

  final String questionId;
  final QuizQuestionTypesEnum type;
  final List<QuestionOptionIdsEnum> answer;
  final String? writtenAnswer;

  @override
  List<Object?> get props => [questionId, type, answer, writtenAnswer];
}

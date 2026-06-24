import 'package:equatable/equatable.dart';

import '../../../../core/entities/quiz_entity.dart';

class ExamPreparationScreenParams with EquatableMixin {
  final String stepTitle;
  final String stepId;
  final QuizEntity quiz;

  const ExamPreparationScreenParams({
    required this.quiz,
    required this.stepTitle,
    required this.stepId,
  });

  @override
  List<Object?> get props => [quiz, stepTitle, stepId];
}

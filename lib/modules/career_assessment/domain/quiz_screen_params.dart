import 'package:equatable/equatable.dart';

class QuizScreenParams with EquatableMixin {
  final String quizId;
  final String stepId;
  final int duration;

  const QuizScreenParams({
    required this.quizId,
    required this.stepId,
    required this.duration,
  });

  @override
  List<Object?> get props => [quizId, stepId, duration];
}

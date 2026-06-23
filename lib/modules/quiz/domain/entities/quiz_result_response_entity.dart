import 'package:equatable/equatable.dart';

class QuizResultResponseEntity extends Equatable {
  final bool success;
  final String message;
  final QuizResultEntity body;

  const QuizResultResponseEntity({
    this.success = false,
    this.message = '',
    this.body = const QuizResultEntity(),
  });

  @override
  List<Object> get props => [success, message, body];
}

class QuizResultEntity extends Equatable {
  final num totalQuestions;
  final num wrongAnswersCount;
  final num correctAnswersCount;
  final String score;

  const QuizResultEntity({
    this.totalQuestions = 0,
    this.wrongAnswersCount = 0,
    this.correctAnswersCount = 0,
    this.score = '',
  });

  @override
  List<Object> get props => [
    totalQuestions,
    wrongAnswersCount,
    correctAnswersCount,
    score,
  ];
}

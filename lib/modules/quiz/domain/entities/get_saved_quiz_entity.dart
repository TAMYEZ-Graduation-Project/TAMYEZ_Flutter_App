import 'package:equatable/equatable.dart';

import '../../../../core/constants/app_enums.dart';
import '../../../../core/entities/quiz_entity.dart';

class GetSavedQuizResponseEntity extends Equatable {
  final bool success;
  final String message;
  final GetSavedQuizBodyEntity body;

  const GetSavedQuizResponseEntity({
    this.success = false,
    this.message = '',
    this.body = const GetSavedQuizBodyEntity(),
  });

  @override
  List<Object?> get props => [success, message, body];
}

class GetSavedQuizBodyEntity extends Equatable {
  final SavedQuizDetailsEntity savedQuiz;

  const GetSavedQuizBodyEntity({
    this.savedQuiz = const SavedQuizDetailsEntity(),
  });

  @override
  List<Object?> get props => [savedQuiz];
}

class SavedQuizDetailsEntity extends Equatable {
  final String id;
  final QuizEntity quizId;
  final String userId;
  final num finalScore;
  final num mcqScore;
  final num writtenScore;
  final List<SavedQuizQuestionEntity> questions;
  final String takenAt;
  final String createdAt;
  final String updatedAt;

  const SavedQuizDetailsEntity({
    this.id = '',
    this.quizId = const QuizEntity(),
    this.userId = '',
    this.finalScore = 0,
    this.mcqScore = 0,
    this.writtenScore = 0,
    this.questions = const [],
    this.takenAt = '',
    this.createdAt = '',
    this.updatedAt = '',
  });

  @override
  List<Object?> get props => [
    id,
    quizId,
    userId,
    finalScore,
    mcqScore,
    writtenScore,
    questions,
    takenAt,
    createdAt,
    updatedAt,
  ];
}

class SavedQuizQuestionEntity extends Equatable {
  final String id;
  final String text;
  final QuizQuestionTypesEnum type;
  final bool isCorrect;
  final List<SavedQuizOptionEntity> options;
  final List<QuestionOptionIdsEnum> userAnswer;
  final String userWrittenAnswer;
  final List<QuestionOptionIdsEnum> correction;
  final String writtenCorrection;
  final String explanation;

  @override
  List<Object?> get props => [
    id,
    text,
    type,
    isCorrect,
    options,
    userAnswer,
    correction,
    explanation,
  ];

  const SavedQuizQuestionEntity({
    this.id = '',
    this.text = '',
    this.type = QuizQuestionTypesEnum.written,
    this.isCorrect = false,
    this.options = const [],
    this.userAnswer = const [],
    this.userWrittenAnswer = '',
    this.correction = const [],
    this.writtenCorrection = '',
    this.explanation = '',
  });
}

class SavedQuizOptionEntity extends Equatable {
  final QuestionOptionIdsEnum id;
  final String text;

  const SavedQuizOptionEntity({
    this.id = QuestionOptionIdsEnum.empty,
    this.text = '',
  });

  @override
  List<Object?> get props => [id, text];
}

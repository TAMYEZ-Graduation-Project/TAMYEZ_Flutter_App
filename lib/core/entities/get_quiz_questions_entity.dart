import '../constants/app_enums.dart';

class GetQuizQuestionsResponseEntity {
  GetQuizQuestionsResponseEntity({
    this.success = false,
    this.message = '',
    required this.body,
  });

  final bool success;
  final String message;
  final QuestionsBodyEntity body;
}

class QuestionsBodyEntity {
  QuestionsBodyEntity({required this.quizAttempt});

  final QuizAttemptEntity quizAttempt;
}

class QuizAttemptEntity {
  QuizAttemptEntity({
    this.id = '',
    this.quizId = '',
    this.userId = '',
    this.createdAt = '',
    this.updatedAt = '',
    this.questions = const [],
  });

  final String id;
  final String quizId;
  final String userId;
  final String createdAt;
  final String updatedAt;
  final List<QuestionEntity> questions;
}

class QuestionEntity {
  QuestionEntity({
    this.id = '',
    this.text = '',
    this.type = QuizQuestionTypesEnum.written,
    this.options = const [],
  });

  final String id;
  final String text;
  final QuizQuestionTypesEnum type;
  final List<OptionEntity> options;
}

class OptionEntity {
  OptionEntity({this.id = '', this.text = ''});

  final String id;
  final String text;
}

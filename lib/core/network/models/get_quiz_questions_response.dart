class GetQuizQuestionsResponseDto {
  GetQuizQuestionsResponseDto({this.success, this.message, this.body});

  GetQuizQuestionsResponseDto.fromJson(Map<String, dynamic> json) {
    success = json['success'] as bool?;
    message = json['message'] as String?;
    body = json['body'] != null
        ? QuestionsBodyDto.fromJson(json['body'] as Map<String, dynamic>)
        : null;
  }

  bool? success;
  String? message;
  QuestionsBodyDto? body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (body != null) {
      map['body'] = body?.toJson();
    }
    return map;
  }
}

class QuestionsBodyDto {
  QuestionsBodyDto({this.quizAttempt});

  QuestionsBodyDto.fromJson(Map<String, dynamic> json) {
    quizAttempt = json['quizAttempt'] != null
        ? QuizAttempt.fromJson(json['quizAttempt'] as Map<String, dynamic>)
        : null;
  }

  QuizAttempt? quizAttempt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (quizAttempt != null) {
      map['quizAttempt'] = quizAttempt?.toJson();
    }
    return map;
  }
}

class QuizAttempt {
  QuizAttempt({
    this.id,
    this.quizId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.questions,
  });

  QuizAttempt.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    quizId = json['quizId'] as String?;
    userId = json['userId'] as String?;
    createdAt = json['createdAt'] as String?;
    updatedAt = json['updatedAt'] as String?;
    if (json['questions'] != null) {
      questions = (json['questions'] as List)
          .map((e) => QuestionDto.fromJson(e as Map<String, dynamic>))
          .toList();
    }
  }

  String? id;
  String? quizId;
  String? userId;
  String? createdAt;
  String? updatedAt;
  List<QuestionDto>? questions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['quizId'] = quizId;
    map['userId'] = userId;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    if (questions != null) {
      map['questions'] = questions?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class QuestionDto {
  QuestionDto({this.id, this.text, this.type, this.options});

  QuestionDto.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    text = json['text'] as String?;
    type = json['type'] as String?;
    if (json['options'] != null) {
      options = (json['options'] as List)
          .map((e) => OptionDto.fromJson(e as Map<String, dynamic>))
          .toList();
    }
  }

  String? id;
  String? text;
  String? type;
  List<OptionDto>? options;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['text'] = text;
    map['type'] = type;
    if (options != null) {
      map['options'] = options?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class OptionDto {
  OptionDto({this.id, this.text});

  OptionDto.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    text = json['text'] as String?;
  }

  String? id;
  String? text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['text'] = text;
    return map;
  }
}

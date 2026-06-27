import '../../../../core/network/models/quiz_dto.dart';

class GetSavedQuizResponseDto {
  final bool? success;
  final String? message;
  final GetSavedQuizBodyDto? body;

  GetSavedQuizResponseDto({this.success, this.message, this.body});

  factory GetSavedQuizResponseDto.fromJson(Map<String, dynamic> json) {
    return GetSavedQuizResponseDto(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      body: json['body'] != null
          ? GetSavedQuizBodyDto.fromJson(json['body'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetSavedQuizBodyDto {
  final SavedQuizDetailsDto? savedQuiz;

  GetSavedQuizBodyDto({this.savedQuiz});

  factory GetSavedQuizBodyDto.fromJson(Map<String, dynamic> json) {
    return GetSavedQuizBodyDto(
      savedQuiz: json['savedQuiz'] != null
          ? SavedQuizDetailsDto.fromJson(
              json['savedQuiz'] as Map<String, dynamic>,
            )
          : null,
    );
  }
}

class SavedQuizDetailsDto {
  final String? id;
  final QuizDto? quizId;
  final String? userId;
  final num? finalScore;
  final num? mcqScore;
  final num? writtenScore;
  final List<SavedQuizQuestionDto>? questions;
  final String? takenAt;
  final String? createdAt;
  final String? updatedAt;

  SavedQuizDetailsDto({
    this.id,
    this.quizId,
    this.userId,
    this.finalScore,
    this.mcqScore,
    this.writtenScore,
    this.questions,
    this.takenAt,
    this.createdAt,
    this.updatedAt,
  });

  factory SavedQuizDetailsDto.fromJson(Map<String, dynamic> json) {
    return SavedQuizDetailsDto(
      id: json['id'] as String?,
      quizId: json['quizId'] != null
          ? QuizDto.fromJson(json['quizId'] as Map<String, dynamic>)
          : null,
      userId: json['userId'] as String?,
      finalScore: json['finalScore'] as num?,
      mcqScore: json['mcqScore'] as num?,
      writtenScore: json['writtenScore'] as num?,
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => SavedQuizQuestionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      takenAt: json['takenAt'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
  }
}

class SavedQuizQuestionDto {
  final String? id;
  final String? text;
  final String? type;
  final bool? isCorrect;
  final List<SavedQuizOptionDto>? options;
  final List<String>? userAnswer;
  final String? userWrittenAnswer;
  final List<String>? correction;
  final String? writtenCorrection;
  final String? explanation;

  SavedQuizQuestionDto({
    this.id,
    this.text,
    this.type,
    this.isCorrect,
    this.options,
    this.userAnswer,
    this.userWrittenAnswer,
    this.correction,
    this.writtenCorrection,
    this.explanation,
  });

  factory SavedQuizQuestionDto.fromJson(Map<String, dynamic> json) {
    return SavedQuizQuestionDto(
      id: json['id'] as String?,
      text: json['text'] as String?,
      type: json['type'] as String?,
      isCorrect: json['isCorrect'] as bool?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => SavedQuizOptionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      userAnswer: (json['userAnswer'] is List)
          ? (json['userAnswer'] as List<dynamic>).cast<String>()
          : null,
      userWrittenAnswer: (json['userAnswer'] is String)
          ? json['userAnswer'] as String
          : null,
      correction: json['correction'] is List
          ? (json['correction'] as List<dynamic>).cast<String>()
          : null,
      writtenCorrection: json['writtenCorrection'] is String
          ? json['writtenCorrection'] as String
          : null,
      explanation: json['explanation'] as String?,
    );
  }
}

class SavedQuizOptionDto {
  final String? id;
  final String? text;

  SavedQuizOptionDto({this.id, this.text});

  factory SavedQuizOptionDto.fromJson(Map<String, dynamic> json) {
    return SavedQuizOptionDto(
      id: json['id'] as String?,
      text: json['text'] as String?,
    );
  }
}

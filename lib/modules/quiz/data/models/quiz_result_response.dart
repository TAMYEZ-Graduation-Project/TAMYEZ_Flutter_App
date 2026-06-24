class QuizResultResponseDto {
  final bool? success;
  final String? message;
  final QuizResultDto? body;

  QuizResultResponseDto({this.success, this.message, this.body});

  factory QuizResultResponseDto.fromJson(Map<String, dynamic> json) {
    return QuizResultResponseDto(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      body: json['body'] != null
          ? QuizResultDto.fromJson(json['body'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'message': message, 'body': body?.toJson()};
  }
}

class QuizResultDto {
  final String? savedQuizId;
  final num? totalQuestions;
  final num? wrongAnswersCount;
  final num? correctAnswersCount;
  final String? score;

  QuizResultDto({
    this.savedQuizId,
    this.totalQuestions,
    this.wrongAnswersCount,
    this.correctAnswersCount,
    this.score,
  });

  factory QuizResultDto.fromJson(Map<String, dynamic> json) {
    return QuizResultDto(
      savedQuizId: json['savedQuizId'] as String?,
      totalQuestions: json['totalQuestions'] as num?,
      wrongAnswersCount: json['wrongAnswersCount'] as num?,
      correctAnswersCount: json['correctAnswersCount'] as num?,
      score: json['score'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'savedQuizId': savedQuizId,
      'totalQuestions': totalQuestions,
      'wrongAnswersCount': wrongAnswersCount,
      'correctAnswersCount': correctAnswersCount,
      'score': score,
    };
  }
}

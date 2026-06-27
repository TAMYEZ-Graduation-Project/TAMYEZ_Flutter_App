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
  final num? finalScore;
  final num? mcqScore;
  final num? writtenScore;
  final num? mcqTotal;
  final num? writtenTotal;

  QuizResultDto({
    this.savedQuizId,
    this.totalQuestions,
    this.wrongAnswersCount,
    this.correctAnswersCount,
    this.finalScore,
    this.mcqScore,
    this.writtenScore,
    this.mcqTotal,
    this.writtenTotal,
  });

  factory QuizResultDto.fromJson(Map<String, dynamic> json) {
    return QuizResultDto(
      savedQuizId: json['savedQuizId'] as String?,
      totalQuestions: json['totalQuestions'] as num?,
      wrongAnswersCount: json['wrongAnswersCount'] as num?,
      correctAnswersCount: json['correctAnswersCount'] as num?,
      finalScore: json['finalScore'] as num?,
      mcqScore: json['mcqScore'] as num?,
      writtenScore: json['writtenScore'] as num?,
      mcqTotal: json['mcqTotal'] as num?,
      writtenTotal: json['writtenTotal'] as num?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'savedQuizId': savedQuizId,
      'totalQuestions': totalQuestions,
      'wrongAnswersCount': wrongAnswersCount,
      'correctAnswersCount': correctAnswersCount,
      'score': finalScore,
      'mcqScore': mcqScore,
      'writtenScore': writtenScore,
      'mcqTotal': mcqTotal,
      'writtenTotal': writtenTotal,
    };
  }
}

import '../../domain/entities/quiz_result_response_entity.dart';
import '../models/quiz_result_response.dart';

extension QuizResultResponseMapper on QuizResultResponseDto {
  QuizResultResponseEntity toEntity() {
    return QuizResultResponseEntity(
      success: success ?? false,
      message: message ?? '',
      body: body?.toEntity() ?? const QuizResultEntity(),
    );
  }
}

extension QuizResultDtoMapper on QuizResultDto {
  QuizResultEntity toEntity() {
    return QuizResultEntity(
      totalQuestions: totalQuestions ?? 0,
      wrongAnswersCount: wrongAnswersCount ?? 0,
      correctAnswersCount: correctAnswersCount ?? 0,
      score: score ?? '',
    );
  }
}

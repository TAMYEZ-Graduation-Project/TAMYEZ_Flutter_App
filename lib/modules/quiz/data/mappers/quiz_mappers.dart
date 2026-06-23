import '../../../../core/entities/pagination_data_entity.dart';
import '../../domain/entities/quiz_result_response_entity.dart';
import '../../domain/entities/saved_quizzes_entity.dart';
import '../models/quiz_result_response.dart';
import '../models/saved_quizzes_response.dart';

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
      savedQuizId: savedQuizId ?? '',
      totalQuestions: totalQuestions ?? 0,
      wrongAnswersCount: wrongAnswersCount ?? 0,
      correctAnswersCount: correctAnswersCount ?? 0,
      score: score ?? '',
    );
  }
}

extension SavedQuizzesResponseMapper on SavedQuizzesResponseDto {
  SavedQuizzesResponseEntity toEntity() {
    return SavedQuizzesResponseEntity(
      success: success ?? false,
      message: message ?? '',
      body: body?.toEntity() ?? const SavedQuizzesBodyEntity(),
    );
  }
}

extension SavedQuizzesBodyDtoMapper on SavedQuizzesBodyDto {
  SavedQuizzesBodyEntity toEntity() {
    return SavedQuizzesBodyEntity(
      savedQuizzes:
          savedQuizzes?.toEntity() ?? const SavedQuizzesPaginationEntity(),
    );
  }
}

extension SavedQuizzesPaginationDtoMapper on SavedQuizzesPaginationDto {
  SavedQuizzesPaginationEntity toEntity() {
    return SavedQuizzesPaginationEntity(
      paginationData: PaginationDataEntity(
        totalCount: totalCount ?? 0,
        totalPages: totalPages ?? 0,
        currentPage: currentPage ?? 0,
        size: size ?? 0,
      ),
      data: data?.map((e) => e.toEntity()).toList() ?? const [],
    );
  }
}

extension SavedQuizDtoMapper on SavedQuizDto {
  SavedQuizEntity toEntity() {
    return SavedQuizEntity(
      id: id ?? '',
      quizId: quizId?.toEntity() ?? const QuizShortInfoEntity(),
      score: score ?? '',
      takenAt: takenAt ?? '',
    );
  }
}

extension QuizShortInfoDtoMapper on QuizShortInfoDto {
  QuizShortInfoEntity toEntity() {
    return QuizShortInfoEntity(
      id: id ?? '',
      title: title ?? '',
      type: type ?? '',
      duration: duration ?? 0,
    );
  }
}

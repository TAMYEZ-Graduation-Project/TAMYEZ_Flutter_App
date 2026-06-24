import '../../../../core/constants/app_enums.dart';
import '../../../../core/entities/pagination_data_entity.dart';
import '../../../../core/entities/quiz_entity.dart';
import '../../../../core/extensions/question_option_id_enum_value.dart';
import '../../../../core/extensions/quiz_question_type_enum_value.dart';
import '../../../../core/mappers/base_career_mapper.dart';
import '../../domain/entities/get_saved_quiz_entity.dart';
import '../../domain/entities/quiz_result_response_entity.dart';
import '../../domain/entities/saved_quizzes_entity.dart';
import '../models/get_saved_quiz_response.dart';
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
      quizId: quizId?.toEntity() ?? const QuizEntity(),
      score: score ?? '',
      takenAt: takenAt ?? '',
    );
  }
}

extension GetSavedQuizResponseMapper on GetSavedQuizResponseDto {
  GetSavedQuizResponseEntity toEntity() {
    return GetSavedQuizResponseEntity(
      success: success ?? false,
      message: message ?? '',
      body: body?.toEntity() ?? const GetSavedQuizBodyEntity(),
    );
  }
}

extension GetSavedQuizBodyDtoMapper on GetSavedQuizBodyDto {
  GetSavedQuizBodyEntity toEntity() {
    return GetSavedQuizBodyEntity(
      savedQuiz: savedQuiz?.toEntity() ?? const SavedQuizDetailsEntity(),
    );
  }
}

extension SavedQuizDetailsDtoMapper on SavedQuizDetailsDto {
  SavedQuizDetailsEntity toEntity() {
    return SavedQuizDetailsEntity(
      id: id ?? '',
      quizId: quizId?.toEntity() ?? const QuizEntity(),
      userId: userId ?? '',
      score: score ?? '',
      questions: questions?.map((e) => e.toEntity()).toList() ?? const [],
      takenAt: takenAt ?? '',
      createdAt: createdAt ?? '',
      updatedAt: updatedAt ?? '',
    );
  }
}

extension SavedQuizQuestionDtoMapper on SavedQuizQuestionDto {
  SavedQuizQuestionEntity toEntity() {
    return SavedQuizQuestionEntity(
      id: id ?? '',
      text: text ?? '',
      type: type?.toQuizQuestionTypeEnum ?? QuizQuestionTypesEnum.written,
      isCorrect: isCorrect ?? false,
      options: options?.map((e) => e.toEntity()).toList() ?? const [],
      userAnswer:
          userAnswer?.map((e) => e.toQuestionOptionIdEnumValue).toList() ??
          const [],
      userWrittenAnswer: userWrittenAnswer ?? '',
      correction:
          correction?.map((e) => e.toQuestionOptionIdEnumValue).toList() ??
          const [],
      writtenCorrection: writtenCorrection ?? '',
      explanation: explanation ?? '',
    );
  }
}

extension SavedQuizOptionDtoMapper on SavedQuizOptionDto {
  SavedQuizOptionEntity toEntity() {
    return SavedQuizOptionEntity(
      id: id?.toQuestionOptionIdEnumValue ?? QuestionOptionIdsEnum.empty,
      text: text ?? '',
    );
  }
}

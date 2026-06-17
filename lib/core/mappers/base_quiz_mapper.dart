import '../constants/app_enums.dart' show QuizQuestionTypesEnum;
import '../entities/get_quiz_questions_entity.dart';
import '../entities/question_answer_entity.dart' show QuestionAnswerEntity;
import '../extensions/quiz_question_type_enum_value.dart';
import '../network/models/get_quiz_questions_response.dart';
import '../network/models/question_answer_dto.dart' show QuestionAnswerDto;

extension GetQuizQuestionsResponseDtoMapper on GetQuizQuestionsResponseDto {
  GetQuizQuestionsResponseEntity toEntity() {
    return GetQuizQuestionsResponseEntity(
      success: success ?? false,
      message: message ?? '',
      body:
          body?.toEntity() ??
          QuestionsBodyEntity(quizAttempt: QuizAttemptEntity()),
    );
  }
}

extension QuestionsBodyDtoMapper on QuestionsBodyDto {
  QuestionsBodyEntity toEntity() {
    return QuestionsBodyEntity(
      quizAttempt: quizAttempt?.toEntity() ?? QuizAttemptEntity(),
    );
  }
}

extension QuizAttemptDtoMapper on QuizAttempt {
  QuizAttemptEntity toEntity() {
    return QuizAttemptEntity(
      id: id ?? '',
      quizId: quizId ?? '',
      userId: userId ?? '',
      createdAt: createdAt ?? '',
      updatedAt: updatedAt ?? '',
      questions: questions?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension QuestionDtoMapper on QuestionDto {
  QuestionEntity toEntity() {
    return QuestionEntity(
      id: id ?? '',
      text: text ?? '',
      type: type?.toQuizQuestionTypeEnum ?? QuizQuestionTypesEnum.written,
      options: options?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension OptionDtoMapper on OptionDto {
  OptionEntity toEntity() {
    return OptionEntity(id: id ?? '', text: text ?? '');
  }
}

extension QuestionAnswerEntityMapper on QuestionAnswerEntity {
  QuestionAnswerDto toDto() {
    return QuestionAnswerDto(
      questionId: questionId,
      type: type.strValue,
      answer: answer.map((e) => e.strValue) as List<String>,
      writtenAnswer: writtenAnswer,
    );
  }
}

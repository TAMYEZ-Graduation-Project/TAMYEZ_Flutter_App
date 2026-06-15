import '../constants/app_enums.dart';

extension QuizQuestionTypeEnumValue on String {
  QuizQuestionTypesEnum get toQuizQuestionTypeEnum {
    switch (this) {
      case 'mcq-single':
        return QuizQuestionTypesEnum.mcqSingle;
      case 'mcq-multi':
        return QuizQuestionTypesEnum.mcqMulti;
      case 'written':
        return QuizQuestionTypesEnum.written;
      default:
        throw Exception('Invalid QuizQuestionTypesEnum value');
    }
  }
}

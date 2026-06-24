import '../constants/app_enums.dart';

extension QuestionOptionIdEnumValue on String {
  QuestionOptionIdsEnum get toQuestionOptionIdEnumValue {
    switch (this) {
      case 'optEmpty':
        return QuestionOptionIdsEnum.empty;
      case 'optA':
        return QuestionOptionIdsEnum.optionA;
      case 'optB':
        return QuestionOptionIdsEnum.optionB;
      case 'optC':
        return QuestionOptionIdsEnum.optionC;
      case 'optD':
        return QuestionOptionIdsEnum.optionD;
      default:
        throw Exception('Invalid QuestionOptionIdsEnum value');
    }
  }
}

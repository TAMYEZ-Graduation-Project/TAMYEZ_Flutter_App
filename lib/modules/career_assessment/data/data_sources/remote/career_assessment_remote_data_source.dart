import '../../../../../core/network/models/get_quiz_questions_response.dart';

abstract interface class CareerAssessmentRemoteDataSource {
  Future<GetQuizQuestionsResponseDto> getCareerAssessmentQuestions();
}

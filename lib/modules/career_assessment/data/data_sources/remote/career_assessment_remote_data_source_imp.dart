import 'package:injectable/injectable.dart';

import '../../../../../core/network/models/check_question_answers_request.dart'
    show CheckQuestionAnswersRequest;
import '../../../../../core/network/models/get_quiz_questions_response.dart';
import '../../../../../core/network/models/simple_api_response.dart';
import '../../models/check_career_assessment_answers_response.dart';
import 'career_assessment_api_client.dart' show CareerAssessmentApiClient;
import 'career_assessment_remote_data_source.dart'
    show CareerAssessmentRemoteDataSource;

@Injectable(as: CareerAssessmentRemoteDataSource)
class CareerAssessmentRemoteDataSourceImp
    implements CareerAssessmentRemoteDataSource {
  final CareerAssessmentApiClient _client;

  const CareerAssessmentRemoteDataSourceImp(this._client);

  @override
  Future<GetQuizQuestionsResponseDto> getCareerAssessmentQuestions() {
    return _client.getCareerAssessmentQuestions(true);
  }

  @override
  Future<CheckCareerAssessmentAnswersResponse> checkCareerAssessmentAnswers({
    required String quizAttemptId,
    required CheckQuestionAnswersRequest request,
  }) async {
    return _client.checkCareerAssessmentAnswers(quizAttemptId, request);
  }

  @override
  Future<SimpleApiResponse> chooseSuggestedCareer({
    required String suggestedCareerId,
  }) {
    return _client.chooseSuggestedCareer(suggestedCareerId);
  }
}

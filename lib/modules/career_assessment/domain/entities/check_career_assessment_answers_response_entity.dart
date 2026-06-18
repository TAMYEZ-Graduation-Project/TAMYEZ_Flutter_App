import 'package:equatable/equatable.dart';

class CheckCareerAssessmentAnswersResponseEntity extends Equatable {
  const CheckCareerAssessmentAnswersResponseEntity({
    this.success = false,
    this.message = '',
    this.body = const CheckCareerAssessmentAnswersResponseBodyEntity(),
  });

  final bool success;
  final String message;
  final CheckCareerAssessmentAnswersResponseBodyEntity body;

  @override
  List<Object?> get props => [success, message, body];
}

class CheckCareerAssessmentAnswersResponseBodyEntity extends Equatable {
  const CheckCareerAssessmentAnswersResponseBodyEntity({
    this.suggestedCareers = const [],
  });

  final List<SuggestedCareerEntity> suggestedCareers;

  @override
  List<Object?> get props => [suggestedCareers];
}

class SuggestedCareerEntity extends Equatable {
  const SuggestedCareerEntity({
    this.careerId = '',
    this.title = '',
    this.reason = '',
    this.confidence = 0,
  });

  final String careerId;
  final String title;
  final String reason;
  final num confidence;

  @override
  List<Object?> get props => [careerId, title, reason, confidence];
}

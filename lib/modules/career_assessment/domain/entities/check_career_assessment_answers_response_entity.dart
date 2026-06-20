import 'package:equatable/equatable.dart';

class CheckCareerAssessmentAnswersResponseEntity extends Equatable {
  const CheckCareerAssessmentAnswersResponseEntity({
    this.success = false,
    this.message = '',
    this.body = const [],
  });

  final bool success;
  final String message;
  final List<SuggestedCareerEntity> body;

  @override
  List<Object?> get props => [success, message, body];
}

class SuggestedCareerEntity extends Equatable {
  const SuggestedCareerEntity({
    this.careerId = const CareerIdEntity(),
    this.title = '',
    this.reason = '',
    this.confidence = 0,
  });

  final CareerIdEntity careerId;
  final String title;
  final String reason;
  final num confidence;

  @override
  List<Object?> get props => [careerId, title, reason, confidence];
}

class CareerIdEntity extends Equatable {
  final String id;
  final String pictureUrl;

  const CareerIdEntity({this.id = '', this.pictureUrl = ''});

  @override
  List<Object?> get props => [id, pictureUrl];
}

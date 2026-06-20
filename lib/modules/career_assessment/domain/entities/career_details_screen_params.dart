import 'package:equatable/equatable.dart';

import 'check_career_assessment_answers_response_entity.dart'
    show SuggestedCareerEntity;

class CareerDetailsScreenParams extends Equatable {
  final String careerImageHeroKey;
  final SuggestedCareerEntity suggestedCareer;

  const CareerDetailsScreenParams({
    required this.careerImageHeroKey,
    required this.suggestedCareer,
  });

  @override
  List<Object?> get props => [careerImageHeroKey, suggestedCareer];
}

sealed class TopCareerMatchesIntent {
  const TopCareerMatchesIntent();
}

class ChooseSuggestedCareerIntent extends TopCareerMatchesIntent {
  final String suggestedCareerId;

  const ChooseSuggestedCareerIntent({required this.suggestedCareerId});
}

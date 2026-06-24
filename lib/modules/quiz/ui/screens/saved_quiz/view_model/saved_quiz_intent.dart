sealed class SavedQuizIntent {
  const SavedQuizIntent();
}

class GetSavedQuizIntent extends SavedQuizIntent {
  final String savedQuizId;

  const GetSavedQuizIntent({required this.savedQuizId});
}

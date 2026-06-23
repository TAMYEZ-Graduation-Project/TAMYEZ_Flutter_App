sealed class SavedQuizzesIntent {
  const SavedQuizzesIntent();
}

class GetSavedQuizzesIntent extends SavedQuizzesIntent {
  const GetSavedQuizzesIntent();
}

class LoadMoreSavedQuizzesIntent extends SavedQuizzesIntent {
  const LoadMoreSavedQuizzesIntent();
}

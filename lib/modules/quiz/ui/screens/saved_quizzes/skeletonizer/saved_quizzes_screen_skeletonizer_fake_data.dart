import '../../../../domain/entities/saved_quizzes_entity.dart';

class SavedQuizzesScreenSkeletonizerFakeData {
  final fakeSavedQuizzes = [
    SavedQuizEntity(
      quizId: const QuizShortInfoEntity(title: 'Quiz 1', id: '1'),
      takenAt: DateTime.now().toString(),
    ),
    SavedQuizEntity(
      quizId: const QuizShortInfoEntity(title: 'Quiz 2', id: '2'),
      takenAt: DateTime.now().toString(),
    ),
    SavedQuizEntity(
      quizId: const QuizShortInfoEntity(title: 'Quiz 3', id: '3'),
      takenAt: DateTime.now().toString(),
    ),
    SavedQuizEntity(
      quizId: const QuizShortInfoEntity(title: 'Quiz 4', id: '4'),
      takenAt: DateTime.now().toString(),
    ),
    SavedQuizEntity(
      quizId: const QuizShortInfoEntity(title: 'Quiz 5', id: '5'),
      takenAt: DateTime.now().toString(),
    ),
    SavedQuizEntity(
      quizId: const QuizShortInfoEntity(title: 'Quiz 6', id: '6'),
      takenAt: DateTime.now().toString(),
    ),
  ];
}

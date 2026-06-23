import 'package:equatable/equatable.dart';

import '../../../../core/entities/pagination_data_entity.dart';

class SavedQuizzesResponseEntity extends Equatable {
  final bool success;
  final String message;
  final SavedQuizzesBodyEntity body;

  const SavedQuizzesResponseEntity({
    this.success = false,
    this.message = '',
    this.body = const SavedQuizzesBodyEntity(),
  });

  @override
  List<Object?> get props => [success, message, body];
}

class SavedQuizzesBodyEntity extends Equatable {
  final SavedQuizzesPaginationEntity savedQuizzes;

  const SavedQuizzesBodyEntity({
    this.savedQuizzes = const SavedQuizzesPaginationEntity(),
  });

  @override
  List<Object?> get props => [savedQuizzes];
}

class SavedQuizzesPaginationEntity extends Equatable {
  final PaginationDataEntity paginationData;

  final List<SavedQuizEntity> data;

  const SavedQuizzesPaginationEntity({
    this.paginationData = const PaginationDataEntity(),
    this.data = const [],
  });

  @override
  List<Object?> get props => [paginationData, data];
}

class SavedQuizEntity extends Equatable {
  final String id;
  final QuizShortInfoEntity quizId;
  final String score;
  final String takenAt;

  const SavedQuizEntity({
    this.id = '',
    this.quizId = const QuizShortInfoEntity(),
    this.score = '',
    this.takenAt = '',
  });

  @override
  List<Object?> get props => [id, quizId, score, takenAt];
}

class QuizShortInfoEntity extends Equatable {
  final String id;
  final String title;
  final String type;
  final int duration;

  const QuizShortInfoEntity({
    this.id = '',
    this.title = '',
    this.type = '',
    this.duration = 0,
  });

  @override
  List<Object?> get props => [id, title, type, duration];
}

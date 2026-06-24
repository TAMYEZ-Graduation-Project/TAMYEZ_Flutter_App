import 'package:equatable/equatable.dart';

import '../../../../../../core/presentation/result/ui_result.dart';
import '../../../../domain/entities/get_saved_quiz_entity.dart';

class SavedQuizState with EquatableMixin {
  final UiResult<SavedQuizDetailsEntity> getSavedQuizResult;

  const SavedQuizState({this.getSavedQuizResult = const Initial()});

  @override
  List<Object> get props => [getSavedQuizResult];

  SavedQuizState copyWith({
    UiResult<SavedQuizDetailsEntity>? getSavedQuizResult,
  }) {
    return SavedQuizState(
      getSavedQuizResult: getSavedQuizResult ?? this.getSavedQuizResult,
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/execution/operation_result.dart';
import '../../../../../../core/presentation/result/ui_result.dart';
import '../../../../domain/entities/get_saved_quiz_entity.dart';
import '../../../../domain/use_cases/get_saved_quiz_use_case.dart';
import 'saved_quiz_intent.dart';
import 'saved_quiz_state.dart';

@injectable
class SavedQuizViewModel extends Cubit<SavedQuizState> {
  final GetSavedQuizUseCase _getSavedQuizUseCase;

  SavedQuizViewModel(this._getSavedQuizUseCase) : super(const SavedQuizState());

  Future<void> doIntent(SavedQuizIntent intent) async {
    switch (intent) {
      case GetSavedQuizIntent():
        await _getSavedQuiz(intent.savedQuizId);
    }
  }

  Future<void> _getSavedQuiz(String savedQuizId) async {
    emit(state.copyWith(getSavedQuizResult: const Loading()));
    final result = await _getSavedQuizUseCase(savedQuizId: savedQuizId);

    switch (result) {
      case OperationSuccess<SavedQuizDetailsEntity>():
        emit(state.copyWith(getSavedQuizResult: Success(result.data)));
      case OperationFailure<SavedQuizDetailsEntity>():
        emit(state.copyWith(getSavedQuizResult: Error(result.failure)));
    }
  }
}

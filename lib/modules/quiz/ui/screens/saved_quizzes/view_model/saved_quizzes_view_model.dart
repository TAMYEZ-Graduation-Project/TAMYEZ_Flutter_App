import 'package:injectable/injectable.dart';

import '../../../../../../core/auth_providers/user_provider.dart';
import '../../../../../../core/execution/operation_result.dart';
import '../../../../../../core/presentation/bases/base_cubit.dart';
import '../../../../../../core/presentation/result/ui_effect.dart';
import '../../../../../../core/presentation/result/ui_result.dart';
import '../../../../domain/entities/saved_quizzes_entity.dart';
import '../../../../domain/use_cases/get_saved_quizzes_use_case.dart';
import 'saved_quizzes_intent.dart';
import 'saved_quizzes_state.dart';

@injectable
class SavedQuizzesViewModel extends BaseCubit<SavedQuizzesState, UiEffect> {
  final GetSavedQuizzesUseCase _getSavedQuizzesUseCase;
  final UserProvider _userProvider;

  SavedQuizzesViewModel(this._getSavedQuizzesUseCase, this._userProvider)
    : super(const SavedQuizzesState());

  Future<void> doIntent(SavedQuizzesIntent intent) async {
    switch (intent) {
      case GetSavedQuizzesIntent():
        await _getSavedQuizzes();
      case LoadMoreSavedQuizzesIntent():
        await _getMoreSavedQuizzes();
    }
  }

  Future<void> _getSavedQuizzes() async {
    emit(state.copyWith(getSavedQuizzesResult: const Loading()));
    final result = await _getSavedQuizzesUseCase(
      userId: _userProvider.user!.id,
      size: 10,
      page: 1,
    );

    if (isClosed) return;
    switch (result) {
      case OperationSuccess<SavedQuizzesPaginationEntity>():
        emit(
          state.copyWith(
            getSavedQuizzesResult: Success(result.data.data),
            paginationData: result.data.paginationData,
          ),
        );
        if (result.warning != null) {
          emitEffect(DisplayWarningEffect(failure: result.warning!));
        }
      case OperationFailure<SavedQuizzesPaginationEntity>():
        emit(state.copyWith(getSavedQuizzesResult: Error(result.failure)));
    }
  }

  Future<void> _getMoreSavedQuizzes() async {
    emit(state.copyWith(isLoadingMore: true));
    final result = await _getSavedQuizzesUseCase(
      userId: _userProvider.user!.id,
      size: state.paginationData.size,
      page: state.paginationData.currentPage + 1,
    );

    if (isClosed) return;
    switch (result) {
      case OperationSuccess<SavedQuizzesPaginationEntity>():
        final savedQuizzes =
            (state.getSavedQuizzesResult as Success<List<SavedQuizEntity>>)
                .data;
        final newSavedQuizzes = savedQuizzes.map((e) => e).toList()
          ..addAll(result.data.data);
        emit(
          state.copyWith(
            getSavedQuizzesResult: Success(newSavedQuizzes),
            paginationData: result.data.paginationData,
          ),
        );
        if (result.warning != null) {
          emitEffect(DisplayWarningEffect(failure: result.warning!));
        }
      case OperationFailure<SavedQuizzesPaginationEntity>():
        emit(state.copyWith(getSavedQuizzesResult: Error(result.failure)));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/presentation/bases/base_stateful_widget_state.dart';
import '../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../core/presentation/mixins/effects_handling_mixin.dart';
import '../../../../../core/presentation/result/ui_result.dart';
import '../../../../../core/presentation/widgets/app_error_widget.dart';
import '../../../domain/entities/saved_quizzes_entity.dart';
import 'skeletonizer/saved_quizzes_screen_skeletonizer_fake_data.dart';
import 'view_model/saved_quizzes_intent.dart';
import 'view_model/saved_quizzes_state.dart';
import 'view_model/saved_quizzes_view_model.dart';
import 'widgets/save_quiz_item.dart';

class SavedQuizzesScreen extends StatefulWidget {
  const SavedQuizzesScreen({super.key});

  @override
  State<SavedQuizzesScreen> createState() => _SavedQuizzesScreenState();
}

class _SavedQuizzesScreenState
    extends BaseStatefulWidgetState<SavedQuizzesScreen>
    with EffectsHandlingMixin {
  final SavedQuizzesViewModel _viewModel = getIt.get();

  final SavedQuizzesScreenSkeletonizerFakeData _screenSkeletonizerFakeData =
      SavedQuizzesScreenSkeletonizerFakeData();

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _viewModel.doIntent(const GetSavedQuizzesIntent());
    _viewModel.effectStream.listen(handleEffects);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _viewModel.doIntent(const LoadMoreSavedQuizzesIntent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _viewModel,
      child: Scaffold(
        appBar: AppBar(
            title: Text(appLocalizations.savedQuizzes), centerTitle: true),
        body:
            BlocSelector<
              SavedQuizzesViewModel,
              SavedQuizzesState,
              UiResult<List<SavedQuizEntity>>
            >(
              selector: (state) => state.getSavedQuizzesResult,
              builder: (context, result) {
                switch (result) {
                  case Initial<List<SavedQuizEntity>>():
                  case Loading<List<SavedQuizEntity>>():
                    return Skeletonizer(
                      child: SavedQuizzesScreenLayout(
                        savedQuizzes:
                            _screenSkeletonizerFakeData.fakeSavedQuizzes,
                      ),
                    );
                  case Success<List<SavedQuizEntity>>():
                    return SavedQuizzesScreenLayout(
                      scrollController: _scrollController,
                      savedQuizzes: result.data,
                    );
                  case Error<List<SavedQuizEntity>>():
                    return AppErrorWidget(
                      failure: result.failure,
                      onRetry: () {
                        _viewModel.doIntent(const GetSavedQuizzesIntent());
                      },
                    );
                }
              },
            ),
      ),
    );
  }
}

class SavedQuizzesScreenLayout extends BaseStatelessWidget {
  final List<SavedQuizEntity> savedQuizzes;
  final ScrollController? scrollController;

  const SavedQuizzesScreenLayout({
    super.key,
    required this.savedQuizzes,
    this.scrollController,
  });

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    final savedQuizzesLength = savedQuizzes.length;
    return BlocSelector<SavedQuizzesViewModel, SavedQuizzesState, bool>(
      selector: (state) => state.isLoadingMore,
      builder: (context, isLoadingMore) {
        if (savedQuizzesLength == 0) {
          return Center(child: Text(d.appLocalizations.noSavedQuizzesFound));
        }
        return Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.separated(
            controller: scrollController,
            itemCount: isLoadingMore
                ? savedQuizzesLength + 1
                : savedQuizzesLength,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
            itemBuilder: (context, index) {
              if (index == savedQuizzesLength) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return SavedQuizItem(savedQuiz: savedQuizzes[index]);
            },
          ),
        );
      },
    );
  }
}

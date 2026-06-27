import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/layers/localization/l10n/generated/app_localizations.dart';
import '../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../core/presentation/result/ui_result.dart';
import '../../../../../core/presentation/widgets/app_error_widget.dart';
import '../../../../../core/presentation/widgets/app_loading_widget.dart';
import '../../../domain/entities/get_saved_quiz_entity.dart';
import 'view_model/saved_quiz_intent.dart';
import 'view_model/saved_quiz_state.dart';
import 'view_model/saved_quiz_view_model.dart';
import 'widgets/question_widget_answer_factory.dart';

class SavedQuizScreen extends StatefulWidget {
  final String savedQuizId;

  const SavedQuizScreen({super.key, required this.savedQuizId});

  @override
  State<SavedQuizScreen> createState() => _SavedQuizScreenState();
}

class _SavedQuizScreenState extends State<SavedQuizScreen> {
  final SavedQuizViewModel _viewModel = getIt.get();

  @override
  void initState() {
    super.initState();
    _viewModel.doIntent(GetSavedQuizIntent(savedQuizId: widget.savedQuizId));
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => _viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(appLocalizations.yourAnswers),
          centerTitle: true,
        ),
        body: SafeArea(
          child:
              BlocSelector<
                SavedQuizViewModel,
                SavedQuizState,
                UiResult<SavedQuizDetailsEntity>
              >(
                selector: (state) => state.getSavedQuizResult,
                builder: (context, result) {
                  switch (result) {
                    case Initial<SavedQuizDetailsEntity>():
                    case Loading<SavedQuizDetailsEntity>():
                      return const AppLoadingWidget();
                    case Success<SavedQuizDetailsEntity>():
                      return _SavedQuizScreenLayout(
                        questions: result.data.questions,
                      );
                    case Error<SavedQuizDetailsEntity>():
                      return AppErrorWidget(
                        failure: result.failure,
                        onRetry: () {
                          _viewModel.doIntent(
                            GetSavedQuizIntent(savedQuizId: widget.savedQuizId),
                          );
                        },
                      );
                  }
                },
              ),
        ),
      ),
    );
  }
}

class _SavedQuizScreenLayout extends BaseStatelessWidget {
  final List<SavedQuizQuestionEntity> questions;

  const _SavedQuizScreenLayout({required this.questions});

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return const SizedBox(height: 22);
        },
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return QuestionWidgetAnswerFactory.create(
            question: questions[index],
            type: questions[index].type,
          );
        },
      ),
    );
  }
}

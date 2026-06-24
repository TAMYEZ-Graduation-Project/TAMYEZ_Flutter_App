import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/entities/get_quiz_questions_entity.dart';
import '../../../../../../core/entities/question_answer_entity.dart';
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../../core/presentation/widgets/question_widget_factory.dart';
import '../view_model/quiz_intent.dart';
import '../view_model/quiz_state.dart';
import '../view_model/quiz_view_model.dart';

class QuestionsPageViewSection extends BaseStatelessWidget {
  final PageController pageController;
  final int questionsLength;
  final List<QuestionEntity> questions;

  const QuestionsPageViewSection({
    super.key,
    required this.pageController,
    required this.questionsLength,
    required this.questions,
  });

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return BlocSelector<
      QuizViewModel,
      QuizState,
      Map<String, QuestionAnswerEntity>
    >(
      selector: (state) => state.questionAnswers,
      builder: (context, questionAnswers) {
        return Expanded(
          flex: 10,
          child: PageView.builder(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: questionsLength,
            itemBuilder: (context, index) {
              return QuestionWidgetFactory.create(
                question: questions[index],
                type: questions[index].type,
                selectedOptionsIds:
                    questionAnswers[questions[index].id]?.answer,
                writtenAnswer:
                    questionAnswers[questions[index].id]?.writtenAnswer,
                onOptionSelected: (optionId) {
                  context.read<QuizViewModel>().doIntent(
                    SelectSingleChoiceAnswerIntent(
                      questionId: questions[index].id,
                      optionId: optionId,
                    ),
                  );
                },
                onMultiOptionSelected: (value, optionId) {
                  context.read<QuizViewModel>().doIntent(
                    SelectMultiChoiceAnswerIntent(
                      questionId: questions[index].id,
                      gotSelected: value,
                      optionId: optionId,
                    ),
                  );
                },
                onWrittenAnswerChange: (value) {
                  context.read<QuizViewModel>().doIntent(
                    SelectWrittenAnswerIntent(
                      questionId: questions[index].id,
                      answer: value,
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

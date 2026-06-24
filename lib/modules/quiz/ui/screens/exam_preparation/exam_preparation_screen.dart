import 'package:flutter/material.dart';

import '../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../core/presentation/routing/defined_routes.dart';
import '../../../../career_assessment/domain/quiz_screen_params.dart';
import '../../../../roadmap/ui/screens/roadmap_step_details/sections/instructions_section.dart';
import '../../../domain/entities/exam_preparation_screen_params.dart';
import 'sections/quiz_details_section.dart';

class ExamPreparationScreen extends BaseStatelessWidget {
  final ExamPreparationScreenParams params;

  const ExamPreparationScreen({super.key, required this.params});

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Scaffold(
      appBar: AppBar(
        title: Text(d.appLocalizations.examPreparation),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              QuizDetailsSection(params: params),
              const SizedBox(height: 32),
              const InstructionsSection(),
              const SizedBox(height: 64),
              FilledButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    DefinedRoutes.quizRoute,
                    arguments: QuizScreenParams(
                      quizId: params.quiz.id,
                      stepId: params.stepId,
                      duration: params.quiz.duration.toInt(),
                    ),
                  );
                },
                child: Text(d.appLocalizations.startQuiz),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

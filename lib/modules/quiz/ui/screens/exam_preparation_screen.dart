import 'package:flutter/material.dart';

import '../../../roadmap/ui/screens/roadmap_step_details/sections/instructions_section.dart';
import '../../domain/entities/exam_preparation_screen_params.dart';
import 'sections/quiz_details_section.dart';

class ExamPreparationScreen extends StatelessWidget {
  final ExamPreparationScreenParams params;

  const ExamPreparationScreen({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exam Preparation'), centerTitle: true),
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
              FilledButton(onPressed: () {}, child: const Text('Start Quiz')),
            ],
          ),
        ),
      ),
    );
  }
}

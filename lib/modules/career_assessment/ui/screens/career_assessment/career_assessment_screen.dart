import 'package:flutter/material.dart';

import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/entities/get_quiz_questions_entity.dart';
import '../../../../../core/presentation/widgets/multi_choice_questions_widget.dart'
    show MultiChoiceQuestionWidget;
import '../../../../../core/presentation/widgets/single_choice_questions_widget.dart';
import '../../../../../core/presentation/widgets/written_question_widget.dart';

class CareerAssessmentScreen extends StatefulWidget {
  const CareerAssessmentScreen({super.key});

  @override
  State<CareerAssessmentScreen> createState() => _CareerAssessmentScreenState();
}

class _CareerAssessmentScreenState extends State<CareerAssessmentScreen> {
  QuestionOptionIdsEnum? selectedOptionId;
  List<QuestionOptionIdsEnum> selectedOptionsIds = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TAMYEZ'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChoiceQuestionWidget(
                selectedOptionId: selectedOptionId,
                question: QuestionEntity(
                  id: '6a3052fb554afd20426af147',
                  text:
                      'Which data structure uses LIFO (Last In, First Out) principle?',
                  options: [
                    OptionEntity(id: 'optA', text: 'Queue'),
                    OptionEntity(id: 'optB', text: 'Stack'),
                  ],
                ),
                onOptionSelected: (optionId) {
                  setState(() {
                    selectedOptionId = optionId;
                  });
                },
              ),
              MultiChoiceQuestionWidget(
                selectedOptionsIds: selectedOptionsIds,
                question: QuestionEntity(
                  id: '6a3052fb554afd20426af147',
                  text:
                      'Which data structure uses LIFO (Last In, First Out) principle?',
                  options: [
                    OptionEntity(id: 'optA', text: 'Queue'),
                    OptionEntity(id: 'optB', text: 'Stack'),
                  ],
                ),
                onOptionSelected: (value, optionId) {
                  setState(() {
                    if (value) {
                      selectedOptionsIds.add(optionId);
                    } else {
                      selectedOptionsIds.remove(optionId);
                    }
                  });
                },
              ),
              WrittenQuestionWidget(
                question: QuestionEntity(
                  id: '6a3052fb554afd20426af147',
                  text: 'Explain the difference between TCP and UDP.',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

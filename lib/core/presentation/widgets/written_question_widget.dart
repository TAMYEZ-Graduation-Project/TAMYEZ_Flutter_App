import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../constants/app_enums.dart';
import '../../entities/get_quiz_questions_entity.dart';
import '../bases/base_stateful_widget_state.dart';

class WrittenQuestionWidget extends StatefulWidget {
  final QuestionEntity question;
  final String? value;
  final void Function(String value)? onChanged;
  const WrittenQuestionWidget({
    super.key,
    required this.question,
    this.value,
    this.onChanged,
  });

  @override
  State<WrittenQuestionWidget> createState() => _WrittenQuestionWidgetState();
}

class _WrittenQuestionWidgetState
    extends BaseStatefulWidgetState<WrittenQuestionWidget> {
  final List<QuestionOptionIdsEnum> options = QuestionOptionIdsEnum.values;
  final TextEditingController _controller = TextEditingController();
  final subject = PublishSubject<String>();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.value?.trim() ?? '';
    subject.debounceTime(const Duration(milliseconds: 500)).listen((value) {
      widget.onChanged?.call(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        Text(widget.question.text, style: typography.title),
        TextFormField(
          controller: _controller,
          minLines: 5,
          maxLines: 15,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          onChanged: subject.add,
          decoration: const InputDecoration(hintText: 'Write your answer here'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    subject.close();
  }
}

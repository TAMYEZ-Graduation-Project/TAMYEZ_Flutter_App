import 'package:flutter/material.dart';

import '../../../../../../core/extensions/text_direction_detector_extension.dart';
import '../../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../../core/presentation/bases/base_stateful_widget_state.dart';
import '../../../../domain/entities/get_saved_quiz_entity.dart';

class WrittenQuestionAnswerWidget extends StatefulWidget {
  final SavedQuizQuestionEntity question;

  const WrittenQuestionAnswerWidget({super.key, required this.question});

  @override
  State<WrittenQuestionAnswerWidget> createState() =>
      _WrittenQuestionAnswerWidgetState();
}

class _WrittenQuestionAnswerWidgetState
    extends BaseStatefulWidgetState<WrittenQuestionAnswerWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.question.userWrittenAnswer;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.question.text,
          textDirection: widget.question.text.textDirection,
          style: typography.title,
        ),
        TextFormField(
          controller: _controller,
          textDirection: widget.question.userWrittenAnswer.textDirection,
          readOnly: true,
          minLines: 5,
          maxLines: 15,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(
            hintText: appLocalizations.writeYourAnswerHere,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.darkGray.withAlpha(90)),
            ),
          ),
        ),
        if (widget.question.explanation.isNotEmpty)
          Text(
            '${appLocalizations.explanation}:\n${widget.question.explanation}',
            style: typography.body,
          ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

import 'package:flutter/material.dart';

import '../../../../../../core/presentation/bases/base_stateless_widget.dart';

class InstructionsSection extends BaseStatelessWidget {
  const InstructionsSection({super.key});

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Column(
      spacing: 25,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          d.appLocalizations.instructions,
          style: d.typography.subTitle.copyWith(fontWeight: FontWeight.w700),
        ),
        _InstructionItem(text: d.appLocalizations.answerAllQuestions),
        _InstructionItem(text: d.appLocalizations.navigateUsingNextAndBack),
        _InstructionItem(text: d.appLocalizations.reviewBeforeSubmitting),
      ],
    );
  }
}

class _InstructionItem extends BaseStatelessWidget {
  final String text;

  const _InstructionItem({required this.text});

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: d.theme.colorScheme.onSurface,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        Text(text, style: d.typography.subTitle),
      ],
    );
  }
}

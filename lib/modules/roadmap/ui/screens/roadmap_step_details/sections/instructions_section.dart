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
          'Instructions',
          style: d.typography.subTitle.copyWith(fontWeight: FontWeight.w700),
        ),
        const _InstructionItem(text: 'Answer all questions.'),
        const _InstructionItem(text: "Navigate using 'Next' and 'back'"),
        const _InstructionItem(text: 'Review before submitting'),
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
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        Text(text, style: d.typography.subTitle),
      ],
    );
  }
}

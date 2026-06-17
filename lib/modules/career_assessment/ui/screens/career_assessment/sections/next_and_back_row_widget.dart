import 'package:flutter/material.dart';

import '../../../../../../core/presentation/bases/base_stateless_widget.dart';

class NextAndBackRowWidget extends BaseStatelessWidget {
  final bool isFirstQuestion;
  final bool isLastQuestion;
  final VoidCallback? onNextTap, onBackTap, onSubmitTap;

  const NextAndBackRowWidget({
    super.key,
    this.isFirstQuestion = false,
    this.isLastQuestion = false,
    this.onBackTap,
    this.onNextTap,
    this.onSubmitTap,
  });

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return isFirstQuestion
        ? SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: onNextTap,
              child: const Text('Next'),
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(onPressed: onBackTap, child: const Text('Back')),
              if (!isLastQuestion)
                FilledButton(onPressed: onNextTap, child: const Text('Next'))
              else
                FilledButton(
                  onPressed: onSubmitTap,
                  child: const Text('Submit'),
                ),
            ],
          );
  }
}

import 'package:flutter/material.dart';

import '../bases/base_stateless_widget.dart';

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
              child: Text(d.appLocalizations.next),
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: onBackTap,
                child: Text(d.appLocalizations.back),
              ),
              if (!isLastQuestion)
                FilledButton(
                  onPressed: onNextTap,
                  child: Text(d.appLocalizations.next),
                )
              else
                FilledButton(
                  onPressed: onSubmitTap,
                  child: Text(d.appLocalizations.submit),
                ),
            ],
          );
  }
}

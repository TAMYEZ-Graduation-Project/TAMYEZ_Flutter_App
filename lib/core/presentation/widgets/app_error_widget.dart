import 'package:flutter/material.dart';

import '../../error/failures/app_failures.dart';
import '../../layers/theme/colors/app_colors.dart';
import '../bases/base_stateless_widget.dart';
import '../error/failure_message_mapper.dart';

class AppErrorWidget extends BaseStatelessWidget {
  final Failure failure;
  final VoidCallback? onRetry;
  final bool center;

  const AppErrorWidget({
    super.key,
    required this.failure,
    this.onRetry,
    this.center = true,
  });

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.error_outline, color: AppColors.red, size: 48),
        const SizedBox(height: 16),
        Text(
          FailureHandling.mapFailureToMessage(d.appLocalizations, failure),
          style: d.typography.subTitle.copyWith(color: AppColors.red),
          textAlign: TextAlign.center,
        ),
        if (onRetry != null) ...[
          const SizedBox(height: 24),
          OutlinedButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh),
            label: Text(
              d.appLocalizations.retry,
              style: d.typography.button.copyWith(
                color: d.theme.colorScheme.primary,
              ),
            ),
          ),
        ],
      ],
    );

    if (center) {
      return Center(
        child: Padding(padding: const EdgeInsets.all(16.0), child: content),
      );
    }

    return content;
  }
}

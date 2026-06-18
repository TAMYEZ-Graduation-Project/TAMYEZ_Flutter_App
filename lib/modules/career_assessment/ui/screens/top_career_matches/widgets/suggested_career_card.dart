import 'package:flutter/material.dart';

import '../../../../../../core/constants/asset_paths.dart';
import '../../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../domain/entities/check_career_assessment_answers_response_entity.dart'
    show SuggestedCareerEntity;

class SuggestedCareerCard extends BaseStatelessWidget {
  final SuggestedCareerEntity career;
  final void Function(String careerId)? onCareerViewTap;
  final void Function(String careerId)? onCareerSelectedTap;

  const SuggestedCareerCard({
    super.key,
    required this.career,
    this.onCareerViewTap,
    this.onCareerSelectedTap,
  });

  final int minConfidence = 60;

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Container(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: career.confidence <= minConfidence
            ? AppColors.middleGray
            : Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                onCareerSelectedTap?.call(career.careerId);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 4,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: d.appLocalizations.confidence,
                          style: d.typography.body.copyWith(
                            color: d.theme.colorScheme.primary,
                          ),
                        ),
                        TextSpan(
                          text: '${career.confidence}%',
                          style: d.typography.body.copyWith(
                            color: career.confidence <= minConfidence
                                ? AppColors.red
                                : d.theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    career.title,
                    style: d.typography.subTitle.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    career.reason,
                    style: d.typography.body.copyWith(
                      color: d.theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Stack(
              alignment: AlignmentGeometry.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(8),
                  child: DecoratedBox(
                    position: DecorationPosition.foreground,
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(60),
                    ),
                    child: Image.asset(AssetPaths.discoverCareerImage),
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsetsGeometry.symmetric(
                      vertical: 12,
                      horizontal: 24,
                    ),
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(4),
                    ),
                  ),
                  onPressed: () {
                    onCareerViewTap?.call(career.careerId);
                  },
                  child: Text(d.appLocalizations.view),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

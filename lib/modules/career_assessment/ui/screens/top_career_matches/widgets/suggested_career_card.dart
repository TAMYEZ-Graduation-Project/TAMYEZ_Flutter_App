import 'package:flutter/material.dart';

import '../../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../../core/presentation/widgets/network_image_caching_widget.dart';
import '../../../../domain/entities/check_career_assessment_answers_response_entity.dart'
    show SuggestedCareerEntity;

class SuggestedCareerCard extends BaseStatelessWidget {
  final String careerImageHeroKey;
  final SuggestedCareerEntity career;
  final void Function()? onCareerViewTap;
  final void Function(String careerId)? onCareerSelectedTap;

  const SuggestedCareerCard({
    super.key,
    required this.careerImageHeroKey,
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
              onTap: career.confidence <= minConfidence
                  ? null
                  : () {
                      onCareerSelectedTap?.call(career.careerId.id);
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
            child: AspectRatio(
              aspectRatio: 1.16,
              child: Stack(
                alignment: AlignmentGeometry.center,
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(8),
                    child: DecoratedBox(
                      position: DecorationPosition.foreground,
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(60),
                      ),
                      child: Hero(
                        tag: careerImageHeroKey,
                        child: NetworkImageCachingWidget(
                          imageUrl: career.careerId.pictureUrl,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: OutlinedButton(
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
                        onCareerViewTap?.call();
                      },
                      child: Text(d.appLocalizations.view),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

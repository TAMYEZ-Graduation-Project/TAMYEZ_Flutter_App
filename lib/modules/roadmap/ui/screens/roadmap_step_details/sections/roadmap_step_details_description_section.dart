import 'package:flutter/material.dart';

import '../../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';

class RoadmapStepDetailsDescriptionSection extends BaseStatelessWidget {
  final String title;
  final String description;

  const RoadmapStepDetailsDescriptionSection({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: d.typography.title.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: d.themeManager.isDarkTheme
                ? AppColors.dark
                : AppColors.lightBlue,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(description, style: d.typography.subTitle),
          ),
        ),
      ],
    );
  }
}

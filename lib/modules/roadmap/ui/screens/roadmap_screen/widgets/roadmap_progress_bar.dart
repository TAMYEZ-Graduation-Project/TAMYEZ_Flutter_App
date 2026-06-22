import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';

class RoadmapProgressBar extends BaseStatelessWidget {
  final double progress;

  const RoadmapProgressBar({super.key, required this.progress});

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(d.appLocalizations.overallProgress,
                style: d.typography.subTitle),
            const SizedBox(height: 12),
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: LinearProgressIndicator(
                    value: progress / 100,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: const AlwaysStoppedAnimation(Colors.black),
                  ),
                ),
                Positioned(
                  top: 10,
                  left:
                      (constraints.maxWidth * (progress / 100)) -
                      min(progress, 30),
                  child: Text(
                    '${progress.toInt()}%',
                    style: d.typography.body.copyWith(color: AppColors.blue),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

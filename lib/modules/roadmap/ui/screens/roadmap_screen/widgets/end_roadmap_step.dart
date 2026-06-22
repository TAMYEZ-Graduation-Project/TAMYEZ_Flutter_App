import 'package:flutter/material.dart';

import '../../../../../../core/entities/roadmap_step_entity.dart';
import '../../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';
import 'roadmap_step_title_and_status_widget.dart';
import 'step_status_widget.dart';

class EndRoadmapStep extends BaseStatelessWidget {
  final TextDirection textDirection;
  final RoadmapStepEntity roadmapStepEntity;

  const EndRoadmapStep({
    super.key,
    this.textDirection = TextDirection.ltr,
    required this.roadmapStepEntity,
  });

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Directionality(
        textDirection: textDirection,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: -4,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: AppColors.dark,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30.0),
                  child: Container(
                    height: 1.5,
                    decoration: BoxDecoration(color: AppColors.dark),
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: RoadmapStepTitleAndStatusWidget(
                          roadmapStepTitle: roadmapStepEntity.title,
                          roadmapStepStatus: roadmapStepEntity.progressStatus,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          Container(
                            width: 2,
                            height: 25,
                            decoration: BoxDecoration(color: AppColors.dark),
                          ),
                          StepStatusWidget(
                            status: roadmapStepEntity.progressStatus,
                          ),
                          Container(
                            width: 2,
                            height: 25,
                            decoration: BoxDecoration(color: AppColors.dark),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: textDirection == TextDirection.ltr ? 30.0 : 0,
                    left: textDirection == TextDirection.rtl ? 30.0 : 0,
                  ),
                  child: Container(
                    height: 1.5,
                    decoration: BoxDecoration(color: AppColors.dark),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

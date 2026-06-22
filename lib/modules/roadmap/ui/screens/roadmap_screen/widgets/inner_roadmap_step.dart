import 'package:flutter/material.dart';

import '../../../../../../core/entities/roadmap_step_entity.dart';
import '../../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';
import 'roadmap_step_title_and_status_widget.dart';
import 'step_status_widget.dart';

class InnerRoadmapStep extends BaseStatelessWidget {
  final TextDirection textDirection;
  final RoadmapStepEntity roadmapStepEntity;
  final bool isNext;

  const InnerRoadmapStep({
    super.key,
    this.textDirection = TextDirection.ltr,
    required this.roadmapStepEntity,
    this.isNext = false,
  });

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Container(
            height: 1.5,
            decoration: BoxDecoration(color: AppColors.dark),
          ),
        ),
        Directionality(
          textDirection: textDirection,
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    width: 2,
                    height: 25,
                    decoration: BoxDecoration(color: AppColors.dark),
                  ),
                  StepStatusWidget(status: roadmapStepEntity.progressStatus),
                  Container(
                    width: 2,
                    height: 25,
                    decoration: BoxDecoration(color: AppColors.dark),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Flexible(
                child: RoadmapStepTitleAndStatusWidget(
                  roadmapStepTitle: roadmapStepEntity.title,
                  roadmapStepStatus: roadmapStepEntity.progressStatus,
                  isNext: isNext,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

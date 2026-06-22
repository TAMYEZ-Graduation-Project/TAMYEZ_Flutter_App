import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_enums.dart';
import '../../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../status_message_mapper/step_progress_status_message_mapper.dart';

class RoadmapStepTitleAndStatusWidget extends BaseStatelessWidget {
  final String roadmapStepTitle;
  final RoadmapStepProgressStatusEnum roadmapStepStatus;
  final bool isNext;

  const RoadmapStepTitleAndStatusWidget({
    super.key,
    required this.roadmapStepTitle,
    required this.roadmapStepStatus,
    this.isNext = false,
  });

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Column(
      children: [
        Text(
          roadmapStepTitle,
          style: d.typography.subTitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          StepProgressStatusMessageMapper.mapStatusToMessage(
            l10n: d.appLocalizations,
            status: roadmapStepStatus,
          ),
          style: d.typography.body.copyWith(color: AppColors.blue),
        ),
      ],
    );
  }
}

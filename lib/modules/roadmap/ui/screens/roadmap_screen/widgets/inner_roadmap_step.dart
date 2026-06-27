import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/app_enums.dart';
import '../../../../../../core/entities/roadmap_step_entity.dart';
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../../core/presentation/routing/defined_routes.dart';
import '../view_model/roadmap_intent.dart';
import '../view_model/roadmap_view_model.dart';
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
            decoration: BoxDecoration(color: d.theme.colorScheme.onSurface),
          ),
        ),
        Directionality(
          textDirection: textDirection,
          child: GestureDetector(
            onTap: () {
              if (roadmapStepEntity.progressStatus ==
                      RoadmapStepProgressStatusEnum.lockedPrereq ||
                  roadmapStepEntity.progressStatus ==
                      RoadmapStepProgressStatusEnum.disabledFrozen) {
                d.displaySnackBar(
                  contentType: ContentType.warning,
                  title: d.appLocalizations.warning,
                  message: d.appLocalizations.lockedOrFrozenMessage,
                );
                return;
              }
              Navigator.pushNamed<RoadmapStepProgressStatusEnum?>(
                context,
                DefinedRoutes.roadmapDetailsRoute,
                arguments: roadmapStepEntity,
              ).then((value) {
                if (value != null &&
                    roadmapStepEntity.progressStatus ==
                        RoadmapStepProgressStatusEnum.available &&
                    value == RoadmapStepProgressStatusEnum.inProgress) {
                  if (!context.mounted) return;
                  context.read<RoadmapViewModel>().doIntent(
                    ConvertAvailableStepToInProgressIntent(
                      stepId: roadmapStepEntity.id,
                    ),
                  );
                }
              });
            },
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 2,
                      height: 25,
                      decoration: BoxDecoration(
                        color: d.theme.colorScheme.onSurface,
                      ),
                    ),
                    StepStatusWidget(status: roadmapStepEntity.progressStatus),
                    Container(
                      width: 2,
                      height: 25,
                      decoration: BoxDecoration(
                        color: d.theme.colorScheme.onSurface,
                      ),
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
        ),
      ],
    );
  }
}

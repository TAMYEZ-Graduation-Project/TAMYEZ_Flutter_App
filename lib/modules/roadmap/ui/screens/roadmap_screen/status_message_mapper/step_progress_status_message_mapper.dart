import '../../../../../../core/constants/app_enums.dart';
import '../../../../../../core/layers/localization/l10n/generated/app_localizations.dart';

abstract class StepProgressStatusMessageMapper {
  static String mapStatusToMessage({
    required AppLocalizations l10n,
    required RoadmapStepProgressStatusEnum status,
  }) {
    switch (status) {
      case RoadmapStepProgressStatusEnum.completed:
        return l10n.complete;
      case RoadmapStepProgressStatusEnum.inProgress:
        return l10n.inProgress;
      case RoadmapStepProgressStatusEnum.available:
        return l10n.available;
      case RoadmapStepProgressStatusEnum.lockedPrereq:
        return l10n.upcoming;
      case RoadmapStepProgressStatusEnum.disabledFrozen:
        return l10n.frozen;
    }
  }
}

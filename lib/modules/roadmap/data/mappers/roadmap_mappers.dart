import '../../../../core/entities/career_entity.dart';
import '../../../../core/entities/pagination_data_entity.dart';
import '../../../../core/entities/roadmap_step_entity.dart';
import '../../../../core/mappers/base_career_mapper.dart';
import '../../../career_assessment/data/models/career_details_response.dart';
import '../../../career_assessment/domain/entities/career_details_entity.dart';
import '../../domain/entities/roadmap_step_details_response_entity.dart';
import '../../domain/entities/roadmap_steps_response_entity.dart';
import '../local_models/career_local.dart';
import '../local_models/roadmap_step_local.dart';
import '../models/roadmap_step_details_response.dart';
import '../models/roadmap_steps_response.dart';

extension CareerDetailsResponseMapper on CareerDetailsResponse {
  CareerDetailsResponseEntity toEntity() {
    return CareerDetailsResponseEntity(
      success: success ?? false,
      message: message ?? '',
      body: body?.toEntity() ?? const CareerEntity(),
    );
  }
}

extension CareerLocalMapperToEntity on CareerLocal {
  CareerEntity toEntity() {
    return CareerEntity(
      id: careerId,
      title: title,
      slug: slug,
      pictureUrl: pictureUrl,
      description: description,
      isActive: isActive,
      stepsCount: stepsCount,
      percentageCompleted: percentageCompleted,
      createdAt: createdAt,
      updatedAt: updatedAt,
      v: v,
    );
  }
}

extension RoadmapStepLocalMapperToEntity on RoadmapStepLocal {
  RoadmapStepEntity toEntity() {
    return RoadmapStepEntity(
      id: stepId,
      order: order,
      progressStatus: progressStatus,
      careerId: careerId,
      title: title,
      description: description,
      createdAt: createdAt,
      updatedAt: updatedAt,
      v: v,
    );
  }
}

extension CareerEntityMapperToLocal on CareerEntity {
  CareerLocal toLocal() {
    return CareerLocal()
      ..careerId = id
      ..title = title
      ..slug = slug
      ..pictureUrl = pictureUrl
      ..description = description
      ..isActive = isActive
      ..stepsCount = stepsCount.toInt()
      ..percentageCompleted = percentageCompleted.toInt()
      ..createdAt = createdAt
      ..updatedAt = updatedAt
      ..v = v.toInt();
  }
}

extension RoadmapStepEntityMapperToLocal on RoadmapStepEntity {
  RoadmapStepLocal toLocal() {
    return RoadmapStepLocal()
      ..stepId = id
      ..order = order.toInt()
      ..progressStatus = progressStatus
      ..careerId = careerId
      ..title = title
      ..description = description
      ..createdAt = createdAt
      ..updatedAt = updatedAt
      ..v = v.toInt();
  }
}

extension RoadmapStepsResponseMapper on RoadmapStepsResponse {
  RoadmapStepsResponseEntity toEntity() {
    return RoadmapStepsResponseEntity(
      success: success ?? false,
      message: message ?? '',
      body: body?.toEntity() ?? const RoadmapStepsResponseBodyEntity(),
    );
  }
}

extension RoadmapStepsResponseBodyMapper on RoadmapStepsResponseBody {
  RoadmapStepsResponseBodyEntity toEntity() {
    return RoadmapStepsResponseBodyEntity(
      paginationData: PaginationDataEntity(
        totalCount: totalCount ?? 0,
        totalPages: totalPages ?? 0,
        currentPage: currentPage ?? 0,
        size: size ?? 0,
      ),
      percentageCompleted: percentageCompleted ?? 0,
      data: data?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension RoadmapStepDetailsResponseMapper on RoadmapStepDetailsResponse {
  RoadmapStepDetailsResponseEntity toEntity() {
    return RoadmapStepDetailsResponseEntity(
      success: success ?? false,
      message: message ?? '',
      body: body?.toEntity() ?? const RoadmapStepEntity(),
    );
  }
}

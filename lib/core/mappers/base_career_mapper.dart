import '../constants/app_enums.dart' show RoadmapStepProgressStatusEnum;
import '../entities/career_entity.dart';
import '../entities/quiz_entity.dart';
import '../entities/resource_entity.dart';
import '../entities/roadmap_step_entity.dart';
import '../extensions/roadmap_step_progress_enum_value.dart';
import '../network/models/career_dto.dart';
import '../network/models/quiz_dto.dart';
import '../network/models/resource_dto.dart';
import '../network/models/roadmap_step_dto.dart';

extension CareerDtoMapper on CareerDto {
  CareerEntity toEntity() {
    return CareerEntity(
      id: id ?? '',
      title: title ?? '',
      slug: slug ?? '',
      pictureUrl: pictureUrl ?? '',
      description: description ?? '',
      isActive: isActive ?? false,
      courses: courses?.map((e) => e.toEntity()).toList() ?? [],
      youtubePlaylists:
          youtubePlaylists?.map((e) => e.toEntity()).toList() ?? [],
      books: books?.map((e) => e.toEntity()).toList() ?? [],
      stepsCount: stepsCount ?? 0,
      percentageCompleted: percentageCompleted ?? 0,
      roadmap: roadmap?.map((e) => e.toEntity()).toList() ?? [],
      createdAt: createdAt ?? '',
      updatedAt: updatedAt ?? '',
      v: v ?? 0,
    );
  }
}

extension RoadmapStepDtoMapper on RoadmapStepDto {
  RoadmapStepEntity toEntity() {
    return RoadmapStepEntity(
      id: id ?? '',
      order: order ?? 0,
      progressStatus:
          progressStatus?.toRoadmapStepProgressEnumValue ??
          RoadmapStepProgressStatusEnum.lockedPrereq,
      careerId: careerId ?? '',
      title: title ?? '',
      description: description ?? '',
      courses: courses?.map((e) => e.toEntity()).toList() ?? [],
      youtubePlaylists:
          youtubePlaylists?.map((e) => e.toEntity()).toList() ?? [],
      books: books?.map((e) => e.toEntity()).toList() ?? [],
      quizzes: quizzes?.map((e) => e.toEntity()).toList() ?? [],
      quizzesIds: quizzesIds ?? [],
      createdAt: createdAt?.toIso8601String() ?? '',
      updatedAt: updatedAt?.toIso8601String() ?? '',
      v: v ?? 0,
    );
  }
}

extension ResourceItemDtoMapper on ResourceItemDto {
  ResourceItemEntity toEntity() {
    return ResourceItemEntity(
      id: id ?? '',
      title: title ?? '',
      url: url ?? '',
      pricingType: pricingType ?? '',
      language: language ?? '',
      appliesTo: appliesTo ?? '',
      specifiedSteps: specifiedSteps ?? [],
    );
  }
}

extension QuizDtoMapper on QuizDto {
  QuizEntity toEntity() {
    return QuizEntity(
      id: id ?? '',
      title: title ?? '',
      description: description ?? '',
      uniqueKey: uniqueKey ?? '',
      type: type ?? '',
      duration: duration ?? 0,
      tags: tags ?? [],
      createdBy: createdBy ?? '',
      createdAt: createdAt?.toIso8601String() ?? '',
      updatedAt: updatedAt?.toIso8601String() ?? '',
      v: v ?? 0,
    );
  }
}

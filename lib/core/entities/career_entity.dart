import 'package:equatable/equatable.dart';

import 'resource_entity.dart';
import 'roadmap_step_entity.dart';

class CareerEntity extends Equatable {
  final String id;
  final String title;
  final String slug;
  final String pictureUrl;
  final String description;
  final bool isActive;
  final List<ResourceItemEntity> courses;
  final List<ResourceItemEntity> youtubePlaylists;
  final List<ResourceItemEntity> books;
  final num stepsCount;
  final List<RoadmapStepEntity> roadmap;
  final String createdAt;
  final String updatedAt;
  final num v;

  const CareerEntity({
    this.id = '',
    this.title = '',
    this.slug = '',
    this.pictureUrl = '',
    this.description = '',
    this.isActive = false,
    this.courses = const [],
    this.youtubePlaylists = const [],
    this.books = const [],
    this.stepsCount = 0,
    this.roadmap = const [],
    this.createdAt = '',
    this.updatedAt = '',
    this.v = 0,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    slug,
    pictureUrl,
    description,
    isActive,
    courses,
    youtubePlaylists,
    books,
    stepsCount,
    roadmap,
    createdAt,
    updatedAt,
    v,
  ];
}

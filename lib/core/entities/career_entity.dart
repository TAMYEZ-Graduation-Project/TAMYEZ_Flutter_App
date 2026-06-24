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
  final int stepsCount;
  final int percentageCompleted;
  final List<RoadmapStepEntity> roadmap;
  final String createdAt;
  final String updatedAt;
  final int orderEpoch;
  final int v;

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
    this.percentageCompleted = 0,
    this.roadmap = const [],
    this.createdAt = '',
    this.updatedAt = '',
    this.orderEpoch = 0,
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
    percentageCompleted,
    roadmap,
    createdAt,
    updatedAt,
    orderEpoch,
    v,
  ];

  CareerEntity copyWith({
    String? id,
    String? title,
    String? slug,
    String? pictureUrl,
    String? description,
    bool? isActive,
    List<ResourceItemEntity>? courses,
    List<ResourceItemEntity>? youtubePlaylists,
    List<ResourceItemEntity>? books,
    int? stepsCount,
    int? percentageCompleted,
    List<RoadmapStepEntity>? roadmap,
    String? createdAt,
    String? updatedAt,
    int? orderEpoch,
    int? v,
  }) {
    return CareerEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      pictureUrl: pictureUrl ?? this.pictureUrl,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
      courses: courses ?? this.courses,
      youtubePlaylists: youtubePlaylists ?? this.youtubePlaylists,
      books: books ?? this.books,
      stepsCount: stepsCount ?? this.stepsCount,
      percentageCompleted: percentageCompleted ?? this.percentageCompleted,
      roadmap: roadmap ?? this.roadmap,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      orderEpoch: orderEpoch ?? this.orderEpoch,
      v: v ?? this.v,
    );
  }
}

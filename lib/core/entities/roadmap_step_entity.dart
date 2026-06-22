import 'package:equatable/equatable.dart';

import '../constants/app_enums.dart';
import 'resource_entity.dart';

class RoadmapStepEntity extends Equatable {
  final String id;
  final num order;
  final RoadmapStepProgressStatusEnum progressStatus;
  final String careerId;
  final String title;
  final String description;
  final List<ResourceItemEntity> courses;
  final List<ResourceItemEntity> youtubePlaylists;
  final List<ResourceItemEntity> books;
  final List<String> quizzes;
  final String createdAt;
  final String updatedAt;
  final num v;

  const RoadmapStepEntity({
    this.id = '',
    this.order = 0,
    this.progressStatus = RoadmapStepProgressStatusEnum.lockedPrereq,
    this.careerId = '',
    this.title = '',
    this.description = '',
    this.courses = const [],
    this.youtubePlaylists = const [],
    this.books = const [],
    this.quizzes = const [],
    this.createdAt = '',
    this.updatedAt = '',
    this.v = 0,
  });

  @override
  List<Object?> get props => [
    id,
    order,
    progressStatus,
    careerId,
    title,
    description,
    courses,
    youtubePlaylists,
    books,
    quizzes,
    createdAt,
    updatedAt,
    v,
  ];

  RoadmapStepEntity copyWith({
    String? id,
    num? order,
    RoadmapStepProgressStatusEnum? progressStatus,
    String? careerId,
    String? title,
    String? description,
    List<ResourceItemEntity>? courses,
    List<ResourceItemEntity>? youtubePlaylists,
    List<ResourceItemEntity>? books,
    List<String>? quizzes,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) {
    return RoadmapStepEntity(
      id: id ?? this.id,
      order: order ?? this.order,
      progressStatus: progressStatus ?? this.progressStatus,
      careerId: careerId ?? this.careerId,
      title: title ?? this.title,
      description: description ?? this.description,
      courses: courses ?? this.courses,
      youtubePlaylists: youtubePlaylists ?? this.youtubePlaylists,
      books: books ?? this.books,
      quizzes: quizzes ?? this.quizzes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }
}

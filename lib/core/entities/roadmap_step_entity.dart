import 'package:equatable/equatable.dart';

import 'quiz_entity.dart';
import 'resource_entity.dart';

class RoadmapStepEntity extends Equatable {
  final String id;
  final num order;
  final String careerId;
  final String title;
  final String description;
  final List<ResourceItemEntity> courses;
  final List<ResourceItemEntity> youtubePlaylists;
  final List<ResourceItemEntity> books;
  final List<QuizEntity> quizzes;
  final String createdAt;
  final String updatedAt;
  final num v;

  const RoadmapStepEntity({
    this.id = '',
    this.order = 0,
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
}

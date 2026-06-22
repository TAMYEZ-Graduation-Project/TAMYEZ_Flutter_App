import 'quiz_dto.dart';
import 'resource_dto.dart';

class RoadmapStepDto {
  final String? id;
  final num? order;
  final String? progressStatus;
  final String? careerId;
  final String? title;
  final String? description;
  final List<ResourceItemDto>? courses;
  final List<ResourceItemDto>? youtubePlaylists;
  final List<ResourceItemDto>? books;
  final List<String>? quizzesIds;
  final List<QuizDto>? quizzes;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final num? v;

  RoadmapStepDto({
    this.id,
    this.order,
    this.progressStatus,
    this.careerId,
    this.title,
    this.description,
    this.courses,
    this.youtubePlaylists,
    this.books,
    this.quizzesIds,
    this.quizzes,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory RoadmapStepDto.fromJson(Map<String, dynamic> json) {
    return RoadmapStepDto(
      id: json['id']?.toString(),
      order: json['order'] as num?,
      progressStatus: json['progressStatus']?.toString(),
      careerId: json['careerId']?.toString(),
      title: json['title'] as String?,
      description: json['description'] as String?,

      courses: (json['courses'] as List?)
          ?.map((e) => ResourceItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),

      youtubePlaylists: (json['youtubePlaylists'] as List?)
          ?.map((e) => ResourceItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),

      books: (json['books'] as List?)
          ?.map((e) => ResourceItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),

      quizzesIds: (json['quizzesIds'] as List?)?.whereType<String>().toList(),
      quizzes: (json['quizzesIds'] as List?)
          ?.whereType<Map<String, dynamic>>()
          .map(QuizDto.fromJson)
          .toList(),
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,

      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,

      v: json['v'] as num?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order': order,
      'progressStatus': progressStatus,
      'careerId': careerId,
      'title': title,
      'description': description,
      'courses': courses?.map((e) => e.toJson()).toList(),
      'youtubePlaylists': youtubePlaylists?.map((e) => e.toJson()).toList(),
      'books': books?.map((e) => e.toJson()).toList(),
      'quizzesIds': quizzesIds,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'v': v,
    };
  }
}

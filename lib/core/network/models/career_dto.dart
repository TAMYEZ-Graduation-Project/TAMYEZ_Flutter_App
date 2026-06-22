import 'resource_dto.dart';
import 'roadmap_step_dto.dart';

class CareerDto {
  CareerDto({
    this.id,
    this.title,
    this.slug,
    this.pictureUrl,
    this.description,
    this.isActive,
    this.courses,
    this.youtubePlaylists,
    this.books,
    this.stepsCount,
    this.roadmap,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  CareerDto.fromJson(dynamic json) {
    id = json['id'] as String?;
    title = json['title'] as String?;
    slug = json['slug'] as String?;
    pictureUrl = json['pictureUrl'] as String?;
    description = json['description'] as String?;
    isActive = json['isActive'] as bool?;
    if (json['courses'] != null) {
      courses = (json['courses'] as List)
          .map(ResourceItemDto.fromJson)
          .toList();
    }
    if (json['youtubePlaylists'] != null) {
      youtubePlaylists = (json['youtubePlaylists'] as List)
          .map(ResourceItemDto.fromJson)
          .toList();
    }
    if (json['books'] != null) {
      books = (json['books'] as List).map(ResourceItemDto.fromJson).toList();
    }
    stepsCount = json['stepsCount'] as num?;
    percentageCompleted = json['percentageCompleted'] as num?;
    if (json['roadmap'] != null) {
      roadmap = (json['roadmap'] as List)
          .map((e) => RoadmapStepDto.fromJson(e as Map<String, dynamic>))
          .whereType<RoadmapStepDto>()
          .toList();
    }
    createdAt = json['createdAt'] as String?;
    updatedAt = json['updatedAt'] as String?;
    v = json['v'] as num?;
  }

  String? id;
  String? title;
  String? slug;
  String? pictureUrl;
  String? description;
  bool? isActive;
  List<ResourceItemDto>? courses;
  List<ResourceItemDto>? youtubePlaylists;
  List<ResourceItemDto>? books;
  num? stepsCount;
  num? percentageCompleted;
  List<RoadmapStepDto>? roadmap;
  String? createdAt;
  String? updatedAt;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['pictureUrl'] = pictureUrl;
    map['description'] = description;
    map['isActive'] = isActive;
    if (courses != null) {
      map['courses'] = courses?.map((v) => v.toJson()).toList();
    }
    if (youtubePlaylists != null) {
      map['youtubePlaylists'] = youtubePlaylists
          ?.map((v) => v.toJson())
          .toList();
    }
    if (books != null) {
      map['books'] = books?.map((v) => v.toJson()).toList();
    }
    map['stepsCount'] = stepsCount;
    map['percentageCompleted'] = percentageCompleted;
    if (roadmap != null) {
      map['roadmap'] = roadmap?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['v'] = v;
    return map;
  }
}

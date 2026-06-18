class CareerDetailsResponse {
  CareerDetailsResponse({this.success, this.message, this.body});

  CareerDetailsResponse.fromJson(dynamic json) {
    success = json['success'] as bool?;
    message = json['message'] as String?;
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }

  bool? success;
  String? message;
  Body? body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (body != null) {
      map['body'] = body?.toJson();
    }
    return map;
  }
}

class Body {
  Body({
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

  Body.fromJson(dynamic json) {
    id = json['id'] as String?;
    title = json['title'] as String?;
    slug = json['slug'] as String?;
    pictureUrl = json['pictureUrl'] as String?;
    description = json['description'] as String?;
    isActive = json['isActive'] as bool?;
    if (json['courses'] != null) {
      courses = (json['courses'] as List).map(ResourceDto.fromJson).toList();
    }
    if (json['youtubePlaylists'] != null) {
      youtubePlaylists = (json['youtubePlaylists'] as List)
          .map(ResourceDto.fromJson)
          .toList();
    }
    if (json['books'] != null) {
      books = (json['books'] as List).map(ResourceDto.fromJson).toList();
    }
    stepsCount = json['stepsCount'] as num?;
    if (json['roadmap'] != null) {
      roadmap = (json['roadmap'] as List).map(RoadmapStepDto.fromJson).toList();
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
  List<ResourceDto>? courses;
  List<ResourceDto>? youtubePlaylists;
  List<ResourceDto>? books;
  num? stepsCount;
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
    if (roadmap != null) {
      map['roadmap'] = roadmap?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['v'] = v;
    return map;
  }
}

class RoadmapStepDto {
  RoadmapStepDto({this.id, this.title, this.description, this.order, this.v});

  RoadmapStepDto.fromJson(dynamic json) {
    id = json['id'] as String?;
    title = json['title'] as String?;
    description = json['description'] as String?;
    order = json['order'] as num?;
    v = json['v'] as num?;
  }

  String? id;
  String? title;
  String? description;
  num? order;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['order'] = order;
    map['v'] = v;
    return map;
  }
}

class ResourceDto {
  ResourceDto({
    this.id,
    this.title,
    this.url,
    this.pricingType,
    this.language,
    this.appliesTo,
    this.specifiedSteps,
  });

  ResourceDto.fromJson(dynamic json) {
    id = json['id'] as String?;
    title = json['title'] as String?;
    url = json['url'] as String?;
    pricingType = json['pricingType'] as String?;
    language = json['language'] as String?;
    appliesTo = json['appliesTo'] as String?;
    specifiedSteps = json['specifiedSteps'] as List<String>?;
  }

  String? id;
  String? title;
  String? url;
  String? pricingType;
  String? language;
  String? appliesTo;
  List<String>? specifiedSteps;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['url'] = url;
    map['pricingType'] = pricingType;
    map['language'] = language;
    map['appliesTo'] = appliesTo;
    map['specifiedSteps'] = specifiedSteps;
    return map;
  }
}

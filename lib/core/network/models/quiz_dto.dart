class QuizDto {
  final String? id;
  final String? title;
  final String? description;
  final String? uniqueKey;
  final String? type;
  final num? duration;
  final List<String>? tags;
  final String? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final num? v;

  QuizDto({
    this.id,
    this.title,
    this.description,
    this.uniqueKey,
    this.type,
    this.duration,
    this.tags,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory QuizDto.fromJson(Map<String, dynamic> json) {
    return QuizDto(
      id: json['id']?.toString(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      uniqueKey: json['uniqueKey'] as String?,
      type: json['type'] as String?,
      duration: json['duration'] as num?,
      tags: (json['tags'] as List?)?.map((e) => e.toString()).toList(),
      createdBy: json['createdBy']?.toString(),
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
      'title': title,
      'description': description,
      'uniqueKey': uniqueKey,
      'type': type,
      'duration': duration,
      'tags': tags,
      'createdBy': createdBy,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'v': v,
    };
  }
}

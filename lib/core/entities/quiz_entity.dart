import 'package:equatable/equatable.dart';

class QuizEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final String aiPrompt;
  final String uniqueKey;
  final String type;
  final num duration;
  final List<String> tags;
  final String createdBy;
  final String createdAt;
  final String updatedAt;
  final num v;

  const QuizEntity({
    this.id = '',
    this.title = '',
    this.description = '',
    this.aiPrompt = '',
    this.uniqueKey = '',
    this.type = '',
    this.duration = 0,
    this.tags = const [],
    this.createdBy = '',
    this.createdAt = '',
    this.updatedAt = '',
    this.v = 0,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    aiPrompt,
    uniqueKey,
    type,
    duration,
    tags,
    createdBy,
    createdAt,
    updatedAt,
    v,
  ];
}

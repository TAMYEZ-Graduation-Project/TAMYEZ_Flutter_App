import 'package:equatable/equatable.dart';

class ResourceItemEntity extends Equatable {
  final String id;
  final String title;
  final String url;
  final String pricingType;
  final String language;
  final String appliesTo;
  final List<String> specifiedSteps;

  const ResourceItemEntity({
    this.id = '',
    this.title = '',
    this.url = '',
    this.pricingType = '',
    this.language = '',
    this.appliesTo = '',
    this.specifiedSteps = const [],
  });

  @override
  List<Object?> get props => [
    id,
    title,
    url,
    pricingType,
    language,
    appliesTo,
    specifiedSteps,
  ];
}

class ResourceItemDto {
  ResourceItemDto({
    this.id,
    this.title,
    this.url,
    this.pricingType,
    this.language,
    this.appliesTo,
    this.specifiedSteps,
  });

  ResourceItemDto.fromJson(dynamic json) {
    id = json['id'] as String?;
    title = json['title'] as String?;
    url = json['url'] as String?;
    pricingType = json['pricingType'] as String?;
    language = json['language'] as String?;
    appliesTo = json['appliesTo'] as String?;
    specifiedSteps = (json['specifiedSteps'] as List?)
        ?.whereType<String>()
        .toList();
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

class UploadProfilePictureResponse {
  UploadProfilePictureResponse({this.success, this.message, this.body});

  UploadProfilePictureResponse.fromJson(dynamic json) {
    success = json['success'] as bool?;
    message = json['message'] as String?;
    body = json['body'] != null
        ? UploadProfilePictureBodyDto.fromJson(json['body'])
        : null;
  }

  bool? success;
  String? message;
  UploadProfilePictureBodyDto? body;

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

class UploadProfilePictureBodyDto {
  UploadProfilePictureBodyDto({this.url, this.v});

  UploadProfilePictureBodyDto.fromJson(dynamic json) {
    url = json['url'] as String?;
    v = json['v'] as num?;
  }

  String? url;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['v'] = v;
    return map;
  }
}

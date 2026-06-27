class FailEnableNotificationCauseModel {
  FailEnableNotificationCauseModel({this.cause});

  FailEnableNotificationCauseModel.fromJson(dynamic json) {
    if (json['error']['cause'] != null) {
      cause = (json['error']['cause'] as List).map((v) {
        return NotificationDeviceDto.fromJson(v);
      }).toList();
    }
  }

  List<NotificationDeviceDto>? cause;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (cause != null) {
      map['cause'] = cause?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class NotificationDeviceDto {
  NotificationDeviceDto({
    this.id,
    this.userId,
    this.deviceId,
    this.jwtTokenExpiresAt,
    this.appVersion,
    this.platform,
    this.os,
    this.deviceModel,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  NotificationDeviceDto.fromJson(dynamic json) {
    id = json['id'] as String?;
    userId = json['userId'] as String?;
    deviceId = json['deviceId'] as String?;
    jwtTokenExpiresAt = json['jwtTokenExpiresAt'] as String?;
    appVersion = json['appVersion'] as String?;
    platform = json['platform'] as String?;
    os = json['os'] as String?;
    deviceModel = json['deviceModel'] as String?;
    isActive = json['isActive'] as bool?;
    createdAt = json['createdAt'] as String?;
    updatedAt = json['updatedAt'] as String?;
    v = json['v'] as num?;
  }

  String? id;
  String? userId;
  String? deviceId;
  String? jwtTokenExpiresAt;
  String? appVersion;
  String? platform;
  String? os;
  String? deviceModel;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userId'] = userId;
    map['deviceId'] = deviceId;
    map['jwtTokenExpiresAt'] = jwtTokenExpiresAt;
    map['appVersion'] = appVersion;
    map['platform'] = platform;
    map['os'] = os;
    map['deviceModel'] = deviceModel;
    map['isActive'] = isActive;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['v'] = v;
    return map;
  }
}

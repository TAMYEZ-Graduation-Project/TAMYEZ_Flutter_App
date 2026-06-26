import 'package:equatable/equatable.dart';

class NotificationDeviceEntity extends Equatable {
  const NotificationDeviceEntity({
    required this.id,
    required this.userId,
    required this.deviceId,
    required this.jwtTokenExpiresAt,
    required this.appVersion,
    required this.platform,
    required this.os,
    required this.deviceModel,
    required this.isActive,
    required this.v,
  });

  final String id;
  final String userId;
  final String deviceId;
  final String jwtTokenExpiresAt;
  final String appVersion;
  final String platform;
  final String os;
  final String deviceModel;
  final bool isActive;
  final num v;

  @override
  List<Object?> get props => [
    id,
    userId,
    deviceId,
    jwtTokenExpiresAt,
    appVersion,
    platform,
    os,
    deviceModel,
    isActive,
    v,
  ];
}

import 'package:equatable/equatable.dart';

class EnableNotificationsParams extends Equatable {
  final String deviceId;
  final String fcmToken;
  final String appVersion;
  final String platform;
  final String os;
  final String deviceModel;

  const EnableNotificationsParams({
    required this.deviceId,
    required this.fcmToken,
    required this.appVersion,
    required this.platform,
    required this.os,
    required this.deviceModel,
  });

  @override
  List<Object?> get props => [
    deviceId,
    fcmToken,
    appVersion,
    platform,
    os,
    deviceModel,
  ];
}

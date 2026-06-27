import 'package:equatable/equatable.dart';

class DeviceInfoEntity extends Equatable {
  final String appVersion;
  final String platform;
  final String os;
  final String deviceModel;

  const DeviceInfoEntity({
    required this.appVersion,
    required this.platform,
    required this.os,
    required this.deviceModel,
  });

  @override
  List<Object?> get props => [appVersion, platform, os, deviceModel];
}

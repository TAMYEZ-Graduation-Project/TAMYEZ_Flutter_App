import 'dart:io' show Platform;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../constants/app_enums.dart';
import '../../entities/device_info_entity.dart';

@injectable
class DeviceInfoService {
  final DeviceInfoPlugin _deviceInfoPlugin;
  final PackageInfo _packageInfo;

  const DeviceInfoService(this._deviceInfoPlugin, this._packageInfo);

  Future<DeviceInfoEntity> getAppDeviceInfo() async {
    final String version = _packageInfo.version;
    String platform;
    String os;
    String deviceModel;

    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfoPlugin.androidInfo;

      platform = PlatformsEnum.flutterAndroid.strValue;
      os = 'Android ${androidInfo.version.release}';
      deviceModel = androidInfo.model;
    } else if (Platform.isIOS) {
      final iosInfo = await _deviceInfoPlugin.iosInfo;

      platform = PlatformsEnum.flutterIos.strValue;
      os = 'iOS ${iosInfo.systemVersion}';
      deviceModel = iosInfo.utsname.machine;
    } else {
      platform = 'flutter-unknown';
      os = 'unknown';
      deviceModel = 'unknown';
    }

    return DeviceInfoEntity(
      appVersion: version,
      platform: platform,
      os: os,
      deviceModel: deviceModel,
    );
  }
}

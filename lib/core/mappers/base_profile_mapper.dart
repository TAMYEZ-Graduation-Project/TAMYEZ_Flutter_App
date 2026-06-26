import '../entities/notification_device_entity.dart';
import '../error/models/fail_enable_notification_cause_model.dart';

extension NotificationDeviceDtoMapper on NotificationDeviceDto {
  NotificationDeviceEntity toEntity() {
    return NotificationDeviceEntity(
      id: id ?? '',
      userId: userId ?? '',
      deviceId: deviceId ?? '',
      jwtTokenExpiresAt: jwtTokenExpiresAt ?? '',
      appVersion: appVersion ?? '',
      platform: platform ?? '',
      os: os ?? '',
      deviceModel: deviceModel ?? '',
      isActive: isActive ?? true,
      v: v ?? 0,
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../../core/entities/notification_device_entity.dart';
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';

class ChooseNotificationDeviceToReplaceWidget extends BaseStatelessWidget {
  final List<NotificationDeviceEntity> devices;
  final void Function(NotificationDeviceEntity) onDeviceSelected;

  const ChooseNotificationDeviceToReplaceWidget({
    super.key,
    required this.devices,
    required this.onDeviceSelected,
  });

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return AlertDialog(
      title: Text(
        d.appLocalizations.exceededMaxDevicesReplacementMessage,
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: devices.length,
          itemBuilder: (context, index) {
            final device = devices[index];
            return ListTile(
              leading: const Icon(Icons.phone_android),
              title: Text(device.deviceModel),
              subtitle: Text('${device.os} • v${device.appVersion}'),
              onTap: () {
                Navigator.pop(context);
                onDeviceSelected(device);
              },
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(d.appLocalizations.cancel),
        ),
      ],
    );
  }
}

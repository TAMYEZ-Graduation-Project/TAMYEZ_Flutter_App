// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../awesome_notification/awesome_notification_service.dart' as _i332;
import '../firebase/messaging/firebase_cloud_messaging_service.dart' as _i983;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i332.AwesomeNotificationService>(
      () => _i332.AwesomeNotificationService(),
    );
    gh.lazySingleton<_i983.FirebaseCloudMessagingService>(
      () => _i983.FirebaseCloudMessagingService(
        gh<_i332.AwesomeNotificationService>(),
      ),
    );
    return this;
  }
}
